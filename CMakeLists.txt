cmake_minimum_required(VERSION 3.4)
project(tun2socks C)
include_directories(./libancillary 
                    ./lwip/src/include/ipv4 
                    ./lwip/src/include/ipv6
                    ./lwip/src/include
                    ./lwip/custom
                    ./)
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DBADVPN_THREADWORK_USE_PTHREAD -DBADVPN_LINUX -DBADVPN_BREACTOR_BADVPN -D_GNU_SOURCE")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DBADVPN_USE_SELFPIPE -DBADVPN_USE_EPOLL")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DBADVPN_LITTLE_ENDIAN -DBADVPN_THREAD_SAFE")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DNDEBUG -DANDROID")
LIST(APPEND SRC_FILES base/BLog_syslog.c 
                    system/BReactor_badvpn.c 
                    system/BSignal.c 
                    system/BConnection_common.c 
                    system/BConnection_unix.c 
                    system/BTime.c 
                    system/BUnixSignal.c 
                    system/BNetwork.c 
                    flow/StreamRecvInterface.c 
                    flow/PacketRecvInterface.c 
                    flow/PacketPassInterface.c 
                    flow/StreamPassInterface.c 
                    flow/SinglePacketBuffer.c 
                    flow/BufferWriter.c 
                    flow/PacketBuffer.c 
                    flow/PacketStreamSender.c 
                    flow/PacketPassConnector.c 
                    flow/PacketProtoFlow.c 
                    flow/PacketPassFairQueue.c 
                    flow/PacketProtoEncoder.c 
                    flow/PacketProtoDecoder.c 
                    socksclient/BSocksClient.c 
                    tuntap/BTap.c 
                    lwip/src/core/timers.c 
                    lwip/src/core/udp.c 
                    lwip/src/core/memp.c 
                    lwip/src/core/init.c 
                    lwip/src/core/pbuf.c 
                    lwip/src/core/tcp.c 
                    lwip/src/core/tcp_out.c 
                    lwip/src/core/netif.c 
                    lwip/src/core/def.c 
                    lwip/src/core/mem.c 
                    lwip/src/core/tcp_in.c 
                    lwip/src/core/stats.c 
                    lwip/src/core/inet_chksum.c 
                    lwip/src/core/ipv4/icmp.c 
                    lwip/src/core/ipv4/igmp.c 
                    lwip/src/core/ipv4/ip4_addr.c 
                    lwip/src/core/ipv4/ip_frag.c 
                    lwip/src/core/ipv4/ip4.c 
                    lwip/src/core/ipv4/autoip.c 
                    lwip/src/core/ipv6/ethip6.c 
                    lwip/src/core/ipv6/inet6.c 
                    lwip/src/core/ipv6/ip6_addr.c 
                    lwip/src/core/ipv6/mld6.c 
                    lwip/src/core/ipv6/dhcp6.c 
                    lwip/src/core/ipv6/icmp6.c 
                    lwip/src/core/ipv6/ip6.c 
                    lwip/src/core/ipv6/ip6_frag.c 
                    lwip/src/core/ipv6/nd6.c 
                    lwip/custom/sys.c 
                    tun2socks/tun2socks.c 
                    base/DebugObject.c 
                    base/BLog.c 
                    base/BPending.c 
                    system/BDatagram_unix.c 
                    flowextra/PacketPassInactivityMonitor.c 
                    tun2socks/SocksUdpGwClient.c 
                    udpgw_client/UdpGwClient.c
                    libancillary/fd_recv.c 
                    libancillary/fd_send.c)
ADD_EXECUTABLE(tun2socks ${SRC_FILES})
TARGET_LINK_LIBRARIES(tun2socks log dl)
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/build/${ANDROID_ABI}")