Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK5VUXXAKGQEQRLBUDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842FF7460
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 13:57:16 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id p4sf2907223lfo.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 04:57:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573477035; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dyg4STyQNWYRJ1OMWtZOrd1nTNGMpfI30C5ZM0nC2422zJCI71fTpC4+Drc2VlPgOU
         fLNa+vMQwMyaeX9FVxx9FiTUJBBtip052qy5eypTTBFDtgwBApTuD3ybsTVaGS+vWQUh
         wD2uZZ0pCtYIXpIwY1aStez+J6gNOIDP65D32x0oWLQ1+EDR2TKyYBKAth2mg5/Z6thz
         5Uq0UmOWuWzwsO24nsACMLel3ldSCp+ZnESZeZ++vQlBUSMBfE+a9cmza5SBPOtK0K+v
         kBpOZ9KSBYmIWE7yFfZ0Fx6f59ra93m0e8xX8XjjFo7cxY8LhyZhFMoWBo/aoJgKhicq
         cYwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=lBKWYEuWJ6fzSKrHmfzZmTQ16a51ypSNsvtNPXWmoso=;
        b=l9JeWg7JtbjfmDg+8U1uwHrehoWDQGjUu8sr57bYKZMipD5xT4nVishmYqC/MCreNd
         I5xAI24QETCyZPeG7+b/MUtfjaakMCsOTgtMdNbWAyeaq7uCkFtUvyt8VXYpnZiqEG9t
         wjcpFJWtw9gosioSCH+g/gt8EpsDToISmOgCCeOG3MtDDRhX+vUnMKoMXZfPk2GGfpAT
         PrgfUbEFu9CZ6wpKJ71QRzLm/liM0YCEstraBr3RPeadrO9n7qOHuTT8YhDYcptGsgWB
         pSvQ1+p5rfrTWZJeLUF1zF0ER4JdDYq3WeeDC2hwRMrhPcydReTPySTGSJ6GxJK1/nYt
         vY1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lBKWYEuWJ6fzSKrHmfzZmTQ16a51ypSNsvtNPXWmoso=;
        b=bYsRzfwTaOOY5IiKp950Fr6ZPq0Z06MfAGJxG/ZcUIJZ/lE7JhbIXpbYxkLcnCcT7i
         AaUXP3+G++n1UoUvrOtIU1I9KkOL6oqyNzSGmVVFlFoLcURJfeW5AbLBPyVD798Nn5f6
         gelw32zEv8ty0D4pSg6quUKE+wSuxGae/w/iradiVtWGR394HI7St+ZbS6R9UmdeaANF
         BeCRzEyZDWYUjDngnnzx7VdicQgeosAxrETP27gI2OxVcKV2hSI7P+Krbl4dPJuZpLcw
         5fRVGNRSpebHBlJS4kb50cZ7GIqAlkOoNEsfBHAZ3YEtSJZZz6ZAMKXugCVGNeSl92KP
         1jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lBKWYEuWJ6fzSKrHmfzZmTQ16a51ypSNsvtNPXWmoso=;
        b=hhXxXftGzFeK7C3PmrhRquQcobpEQTROH8zdcw+KKh1yO6Aq0hn6o/Nyc7rsr1bGZT
         3CJqCe9GYY6dHBPnDDwIES9Swo6qKVOAeoUiyrGCP1P9DUPMWuTqupyVqcdqPcFBW6bI
         l+XXUAUB1N5YjEsNdxzVmEe00ZXjKhGJ/ZvWTDhtztPgnnTR7j7AogyJoSUGr/e1F7x4
         ieTWq5rbAZTL+GZ1zp8n1Iuz+nHHRzoaR0S6QRGrWqVeC1FBW/z+K6M7BGw7eA37hq3f
         krmKeZWZNr9S4x7Imrwyk+oy7FSFMeFFFem6rugAtV4I7pc8mQOUpvpKJPtBZTdJ4amr
         0dKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXaT71YavdoR1Jp51ZGFEDTR/SONYk93DN/bx5okXBHQD5VK5q9
	YQYUZzlBLq1lqxFn2iOBhtw=
X-Google-Smtp-Source: APXvYqyihDOg9agEXor6XC3eAVUT0IfOCOqqr7dCfTnpiTGEv+lWzfphx+ueZJ7EIJks/43EJOy5Zw==
X-Received: by 2002:ac2:4ace:: with SMTP id m14mr15669993lfp.130.1573477035686;
        Mon, 11 Nov 2019 04:57:15 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c8d8:: with SMTP id y207ls790325lff.14.gmail; Mon, 11
 Nov 2019 04:57:14 -0800 (PST)
X-Received: by 2002:ac2:4919:: with SMTP id n25mr3802280lfi.58.1573477034597;
        Mon, 11 Nov 2019 04:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573477034; cv=none;
        d=google.com; s=arc-20160816;
        b=OiXJyGUUncCC3jUmHtW9qL/sg+xhr9CrahbqKR8Y+Y34X+yJXQaSaBtKml/Ui4zMN6
         IIewoyDPz7mCaFrC1UyFLaai0M7HUV/7AWFI93083Gjx54Xps47wHnVaHZq3VvMuo9cu
         LKspbrlj+xxoD+axfQXZ0ImiqPsxJwpfgDpRrrD6+7N0jJtkJ4hgV+m+tKf5FVFYAOHm
         N2u5DqEed3FL3Ge989EQXlfogUJ9Q5s1fgdBIxl8f94hU8AiT7xiRQ1tYlUHhM3HhUIL
         yypm81913VTQFEqe3H9NREla7GZeDRJXyUIDE5185aXykoM+KgrKNDOjsn0m2x2k7+Yo
         mmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:cc:to:from;
        bh=6VfFYbzGr/b1KabbQv6jSuQy3L4VFOBXbP6euW48kGc=;
        b=WVQwq5k0E0ueYniwNjNPiQy3Y4sq1ugrkXJlTMOt6oJYSK0a5P3/TOH724rOdVTqWA
         6RJ1/IEsVU6x6dK45yRNBS6qtu8B6bRvILIoui0/V0yiT2pjSDZd3TYcVrPQYmUysYGM
         f09xA1xtfsNUNRa0b8g6rknOqPfz+3Mr9uP1eHFyiSckKZ20Bf31p4ApwKpmqjKr/VHs
         g9lfnDtgF0RGn4eRrbnesxc51DNIEgtojQUrGslA5arKKfkFHCqfp6BPOjxWHdhgdFB8
         0ktu7/UGZRYt3q+65wRfzL8NlNPG+R7SY13kZ62xJbwCEy6FTiMsWQCGuLi6eQFiG2Zz
         g2Pg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z9si1198871ljj.4.2019.11.11.04.57.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 04:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xABCvDJI024157
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 13:57:13 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xABCvCBG010919;
	Mon, 11 Nov 2019 13:57:12 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [RFC][PATCH 3/3] contrib: Add server for ivshmem revision 2
Date: Mon, 11 Nov 2019 13:57:12 +0100
Message-Id: <349ba45e162e248a49d83a5ae0cebeb8b7feb032.1573477032.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1573477032.git.jan.kiszka@siemens.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573477032.git.jan.kiszka@siemens.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

From: Jan Kiszka <jan.kiszka@siemens.com>

This implements the server process for ivshmem v2 device models of QEMU.
Again, no effort has been spent yet on sharing code with the v1 server.
Parts have been copied, others were rewritten.

In addition to parameters of v1, this server now also specifies

 - the maximum number of peers to be connected (required to know in
   advance because of v2's state table)
 - the size of the output sections (can be 0)
 - the protocol ID to be published to all peers

When a virtio protocol ID is chosen, only 2 peers can be connected.
Furthermore, the server will signal the backend variant of the ID to the
master instance and the frontend ID to the slave peer.

To start, e.g., a server that allows virtio console over ivshmem, call

ivshmem2-server -F -l 64K -n 2 -V 3 -P 0x8003

TODO: specify the new server protocol.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Makefile                                  |   3 +
 Makefile.objs                             |   1 +
 configure                                 |   1 +
 contrib/ivshmem2-server/Makefile.objs     |   1 +
 contrib/ivshmem2-server/ivshmem2-server.c | 462 ++++++++++++++++++++++++++++++
 contrib/ivshmem2-server/ivshmem2-server.h | 158 ++++++++++
 contrib/ivshmem2-server/main.c            | 313 ++++++++++++++++++++
 7 files changed, 939 insertions(+)
 create mode 100644 contrib/ivshmem2-server/Makefile.objs
 create mode 100644 contrib/ivshmem2-server/ivshmem2-server.c
 create mode 100644 contrib/ivshmem2-server/ivshmem2-server.h
 create mode 100644 contrib/ivshmem2-server/main.c

diff --git a/Makefile b/Makefile
index aa9d1a42aa..85b5e985ac 100644
--- a/Makefile
+++ b/Makefile
@@ -430,6 +430,7 @@ dummy := $(call unnest-vars,, \
                 elf2dmp-obj-y \
                 ivshmem-client-obj-y \
                 ivshmem-server-obj-y \
+                ivshmem2-server-obj-y \
                 rdmacm-mux-obj-y \
                 libvhost-user-obj-y \
                 vhost-user-scsi-obj-y \
@@ -662,6 +663,8 @@ ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
+ivshmem2-server$(EXESUF): $(ivshmem2-server-obj-y) $(COMMON_LDADDS)
+	$(call LINK, $^)
 endif
 vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) libvhost-user.a
 	$(call LINK, $^)
diff --git a/Makefile.objs b/Makefile.objs
index 11ba1a36bd..a4a729d808 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -117,6 +117,7 @@ qga-vss-dll-obj-y = qga/
 elf2dmp-obj-y = contrib/elf2dmp/
 ivshmem-client-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-client/
 ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
+ivshmem2-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem2-server/
 libvhost-user-obj-y = contrib/libvhost-user/
 vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
 vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
diff --git a/configure b/configure
index efe165edf9..1b466b2461 100755
--- a/configure
+++ b/configure
@@ -6184,6 +6184,7 @@ if test "$want_tools" = "yes" ; then
   fi
   if [ "$ivshmem" = "yes" ]; then
     tools="ivshmem-client\$(EXESUF) ivshmem-server\$(EXESUF) $tools"
+    tools="ivshmem2-server\$(EXESUF) $tools"
   fi
   if [ "$curl" = "yes" ]; then
       tools="elf2dmp\$(EXESUF) $tools"
diff --git a/contrib/ivshmem2-server/Makefile.objs b/contrib/ivshmem2-server/Makefile.objs
new file mode 100644
index 0000000000..d233e18ec8
--- /dev/null
+++ b/contrib/ivshmem2-server/Makefile.objs
@@ -0,0 +1 @@
+ivshmem2-server-obj-y = ivshmem2-server.o main.o
diff --git a/contrib/ivshmem2-server/ivshmem2-server.c b/contrib/ivshmem2-server/ivshmem2-server.c
new file mode 100644
index 0000000000..b341f1fcd0
--- /dev/null
+++ b/contrib/ivshmem2-server/ivshmem2-server.c
@@ -0,0 +1,462 @@
+/*
+ * Copyright 6WIND S.A., 2014
+ * Copyright (c) Siemens AG, 2019
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/sockets.h"
+#include "qemu/atomic.h"
+
+#include <sys/socket.h>
+#include <sys/un.h>
+
+#include "ivshmem2-server.h"
+
+/* log a message on stdout if verbose=1 */
+#define IVSHMEM_SERVER_DEBUG(server, fmt, ...) do { \
+        if ((server)->args.verbose) {         \
+            printf(fmt, ## __VA_ARGS__); \
+        }                                \
+    } while (0)
+
+/** maximum size of a huge page, used by ivshmem_server_ftruncate() */
+#define IVSHMEM_SERVER_MAX_HUGEPAGE_SIZE (1024 * 1024 * 1024)
+
+/** default listen backlog (number of sockets not accepted) */
+#define IVSHMEM_SERVER_LISTEN_BACKLOG 10
+
+/* send message to a client unix socket */
+static int ivshmem_server_send_msg(int sock_fd, void *payload, int len, int fd)
+{
+    int ret;
+    struct msghdr msg;
+    struct iovec iov[1];
+    union {
+        struct cmsghdr cmsg;
+        char control[CMSG_SPACE(sizeof(int))];
+    } msg_control;
+    struct cmsghdr *cmsg;
+
+    iov[0].iov_base = payload;
+    iov[0].iov_len = len;
+
+    memset(&msg, 0, sizeof(msg));
+    msg.msg_iov = iov;
+    msg.msg_iovlen = 1;
+
+    /* if fd is specified, add it in a cmsg */
+    if (fd >= 0) {
+        memset(&msg_control, 0, sizeof(msg_control));
+        msg.msg_control = &msg_control;
+        msg.msg_controllen = sizeof(msg_control);
+        cmsg = CMSG_FIRSTHDR(&msg);
+        cmsg->cmsg_level = SOL_SOCKET;
+        cmsg->cmsg_type = SCM_RIGHTS;
+        cmsg->cmsg_len = CMSG_LEN(sizeof(int));
+        memcpy(CMSG_DATA(cmsg), &fd, sizeof(fd));
+    }
+
+    ret = sendmsg(sock_fd, &msg, 0);
+    if (ret <= 0) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static int ivshmem_server_send_event_fd(int sock_fd, int peer_id, int vector,
+                                        int fd)
+{
+    IvshmemEventFd msg = {
+        .header = {
+            .type = GUINT32_TO_LE(IVSHMEM_MSG_EVENT_FD),
+            .len = GUINT32_TO_LE(sizeof(msg)),
+        },
+        .id = GUINT32_TO_LE(peer_id),
+        .vector = GUINT32_TO_LE(vector),
+    };
+
+    return ivshmem_server_send_msg(sock_fd, &msg, sizeof(msg), fd);
+}
+
+/* free a peer when the server advertises a disconnection or when the
+ * server is freed */
+static void
+ivshmem_server_free_peer(IvshmemServer *server, IvshmemServerPeer *peer)
+{
+    unsigned vector;
+    IvshmemServerPeer *other_peer;
+    IvshmemPeerGone msg = {
+        .header = {
+            .type = GUINT32_TO_LE(IVSHMEM_MSG_PEER_GONE),
+            .len = GUINT32_TO_LE(sizeof(msg)),
+        },
+        .id = GUINT32_TO_LE(peer->id),
+    };
+
+    IVSHMEM_SERVER_DEBUG(server, "free peer %" PRId64 "\n", peer->id);
+    close(peer->sock_fd);
+    QTAILQ_REMOVE(&server->peer_list, peer, next);
+
+    server->state_table[peer->id] = 0;
+    smp_mb();
+
+    /* advertise the deletion to other peers */
+    QTAILQ_FOREACH(other_peer, &server->peer_list, next) {
+        ivshmem_server_send_msg(other_peer->sock_fd, &msg, sizeof(msg), -1);
+    }
+
+    for (vector = 0; vector < peer->vectors_count; vector++) {
+        event_notifier_cleanup(&peer->vectors[vector]);
+    }
+
+    g_free(peer);
+}
+
+/* send the peer id and the shm_fd just after a new client connection */
+static int
+ivshmem_server_send_initial_info(IvshmemServer *server, IvshmemServerPeer *peer)
+{
+    IvshmemInitialInfo msg = {
+        .header = {
+            .type = GUINT32_TO_LE(IVSHMEM_MSG_INIT),
+            .len = GUINT32_TO_LE(sizeof(msg)),
+        },
+        .version = GUINT32_TO_LE(IVSHMEM_PROTOCOL_VERSION),
+        .compatible_version = GUINT32_TO_LE(IVSHMEM_PROTOCOL_VERSION),
+        .id = GUINT32_TO_LE(peer->id),
+        .max_peers = GUINT32_TO_LE(server->args.max_peers),
+        .vectors = GUINT32_TO_LE(server->args.vectors),
+        .protocol = GUINT32_TO_LE(server->args.protocol),
+        .output_section_size = GUINT64_TO_LE(server->args.output_section_size),
+    };
+    unsigned virtio_protocol;
+    int ret;
+
+    if (server->args.protocol >= 0x8000) {
+        virtio_protocol = server->args.protocol & ~0x4000;
+        msg.protocol &= ~0x4000;
+        if (peer->id == 0) {
+            virtio_protocol |= 0x4000;
+        }
+        msg.protocol = GUINT32_TO_LE(virtio_protocol);
+    }
+
+    ret = ivshmem_server_send_msg(peer->sock_fd, &msg, sizeof(msg),
+                                  server->shm_fd);
+    if (ret < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot send initial info: %s\n",
+                             strerror(errno));
+        return -1;
+    }
+
+    return 0;
+}
+
+/* handle message on listening unix socket (new client connection) */
+static int
+ivshmem_server_handle_new_conn(IvshmemServer *server)
+{
+    IvshmemServerPeer *peer, *other_peer;
+    struct sockaddr_un unaddr;
+    socklen_t unaddr_len;
+    int newfd;
+    unsigned i;
+
+    /* accept the incoming connection */
+    unaddr_len = sizeof(unaddr);
+    newfd = qemu_accept(server->sock_fd,
+                        (struct sockaddr *)&unaddr, &unaddr_len);
+
+    if (newfd < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot accept() %s\n", strerror(errno));
+        return -1;
+    }
+
+    qemu_set_nonblock(newfd);
+    IVSHMEM_SERVER_DEBUG(server, "accept()=%d\n", newfd);
+
+    /* allocate new structure for this peer */
+    peer = g_malloc0(sizeof(*peer));
+    peer->sock_fd = newfd;
+
+    /* get an unused peer id */
+    /* XXX: this could use id allocation such as Linux IDA, or simply
+     * a free-list */
+    for (i = 0; i < G_MAXUINT16; i++) {
+        if (ivshmem_server_search_peer(server, i) == NULL) {
+            break;
+        }
+    }
+    if (i >= server->args.max_peers) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot allocate new client id\n");
+        close(newfd);
+        g_free(peer);
+        return -1;
+    }
+    peer->id = i;
+
+    /* create eventfd, one per vector */
+    peer->vectors_count = server->args.vectors;
+    for (i = 0; i < peer->vectors_count; i++) {
+        if (event_notifier_init(&peer->vectors[i], FALSE) < 0) {
+            IVSHMEM_SERVER_DEBUG(server, "cannot create eventfd\n");
+            goto fail;
+        }
+    }
+
+    /* send peer id and shm fd */
+    if (ivshmem_server_send_initial_info(server, peer) < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot send initial info\n");
+        goto fail;
+    }
+
+    /* advertise the new peer to others */
+    QTAILQ_FOREACH(other_peer, &server->peer_list, next) {
+        for (i = 0; i < peer->vectors_count; i++) {
+            ivshmem_server_send_event_fd(other_peer->sock_fd, peer->id, i,
+                                         peer->vectors[i].wfd);
+        }
+    }
+
+    /* advertise the other peers to the new one */
+    QTAILQ_FOREACH(other_peer, &server->peer_list, next) {
+        for (i = 0; i < peer->vectors_count; i++) {
+            ivshmem_server_send_event_fd(peer->sock_fd, other_peer->id, i,
+                                         other_peer->vectors[i].wfd);
+        }
+    }
+
+    /* advertise the new peer to itself */
+    for (i = 0; i < peer->vectors_count; i++) {
+        ivshmem_server_send_event_fd(peer->sock_fd, peer->id, i,
+                                     event_notifier_get_fd(&peer->vectors[i]));
+    }
+
+    QTAILQ_INSERT_TAIL(&server->peer_list, peer, next);
+    IVSHMEM_SERVER_DEBUG(server, "new peer id = %" PRId64 "\n",
+                         peer->id);
+    return 0;
+
+fail:
+    while (i--) {
+        event_notifier_cleanup(&peer->vectors[i]);
+    }
+    close(newfd);
+    g_free(peer);
+    return -1;
+}
+
+/* Try to ftruncate a file to next power of 2 of shmsize.
+ * If it fails; all power of 2 above shmsize are tested until
+ * we reach the maximum huge page size. This is useful
+ * if the shm file is in a hugetlbfs that cannot be truncated to the
+ * shm_size value. */
+static int
+ivshmem_server_ftruncate(int fd, unsigned shmsize)
+{
+    int ret;
+    struct stat mapstat;
+
+    /* align shmsize to next power of 2 */
+    shmsize = pow2ceil(shmsize);
+
+    if (fstat(fd, &mapstat) != -1 && mapstat.st_size == shmsize) {
+        return 0;
+    }
+
+    while (shmsize <= IVSHMEM_SERVER_MAX_HUGEPAGE_SIZE) {
+        ret = ftruncate(fd, shmsize);
+        if (ret == 0) {
+            return ret;
+        }
+        shmsize *= 2;
+    }
+
+    return -1;
+}
+
+/* Init a new ivshmem server */
+void ivshmem_server_init(IvshmemServer *server)
+{
+    server->sock_fd = -1;
+    server->shm_fd = -1;
+    server->state_table = NULL;
+    QTAILQ_INIT(&server->peer_list);
+}
+
+/* open shm, create and bind to the unix socket */
+int
+ivshmem_server_start(IvshmemServer *server)
+{
+    struct sockaddr_un sun;
+    int shm_fd, sock_fd, ret;
+    void *state_table;
+
+    /* open shm file */
+    if (server->args.use_shm_open) {
+        IVSHMEM_SERVER_DEBUG(server, "Using POSIX shared memory: %s\n",
+                             server->args.shm_path);
+        shm_fd = shm_open(server->args.shm_path, O_CREAT | O_RDWR, S_IRWXU);
+    } else {
+        gchar *filename = g_strdup_printf("%s/ivshmem.XXXXXX",
+                                          server->args.shm_path);
+        IVSHMEM_SERVER_DEBUG(server, "Using file-backed shared memory: %s\n",
+                             server->args.shm_path);
+        shm_fd = mkstemp(filename);
+        unlink(filename);
+        g_free(filename);
+    }
+
+    if (shm_fd < 0) {
+        fprintf(stderr, "cannot open shm file %s: %s\n", server->args.shm_path,
+                strerror(errno));
+        return -1;
+    }
+    if (ivshmem_server_ftruncate(shm_fd, server->args.shm_size) < 0) {
+        fprintf(stderr, "ftruncate(%s) failed: %s\n", server->args.shm_path,
+                strerror(errno));
+        goto err_close_shm;
+    }
+    state_table = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
+                       shm_fd, 0);
+    if (state_table == MAP_FAILED) {
+        fprintf(stderr, "mmap failed: %s\n", strerror(errno));
+        goto err_close_shm;
+    }
+
+    IVSHMEM_SERVER_DEBUG(server, "create & bind socket %s\n",
+                         server->args.unix_socket_path);
+
+    /* create the unix listening socket */
+    sock_fd = socket(AF_UNIX, SOCK_STREAM, 0);
+    if (sock_fd < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot create socket: %s\n",
+                             strerror(errno));
+        goto err_unmap;
+    }
+
+    sun.sun_family = AF_UNIX;
+    ret = snprintf(sun.sun_path, sizeof(sun.sun_path), "%s",
+                   server->args.unix_socket_path);
+    if (ret < 0 || ret >= sizeof(sun.sun_path)) {
+        IVSHMEM_SERVER_DEBUG(server, "could not copy unix socket path\n");
+        goto err_close_sock;
+    }
+    if (bind(sock_fd, (struct sockaddr *)&sun, sizeof(sun)) < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "cannot connect to %s: %s\n", sun.sun_path,
+                             strerror(errno));
+        goto err_close_sock;
+    }
+
+    if (listen(sock_fd, IVSHMEM_SERVER_LISTEN_BACKLOG) < 0) {
+        IVSHMEM_SERVER_DEBUG(server, "listen() failed: %s\n", strerror(errno));
+        goto err_close_sock;
+    }
+
+    server->sock_fd = sock_fd;
+    server->shm_fd = shm_fd;
+    server->state_table = state_table;
+
+    return 0;
+
+err_close_sock:
+    close(sock_fd);
+err_unmap:
+    munmap(state_table, 4096);
+err_close_shm:
+    if (server->args.use_shm_open) {
+        shm_unlink(server->args.shm_path);
+    }
+    close(shm_fd);
+    shm_unlink(server->args.shm_path);
+    return -1;
+}
+
+/* close connections to clients, the unix socket and the shm fd */
+void
+ivshmem_server_close(IvshmemServer *server)
+{
+    IvshmemServerPeer *peer, *npeer;
+
+    IVSHMEM_SERVER_DEBUG(server, "close server\n");
+
+    QTAILQ_FOREACH_SAFE(peer, &server->peer_list, next, npeer) {
+        ivshmem_server_free_peer(server, peer);
+    }
+
+    unlink(server->args.unix_socket_path);
+    if (server->args.use_shm_open) {
+        shm_unlink(server->args.shm_path);
+    }
+    close(server->sock_fd);
+    munmap(server->state_table, 4096);
+    close(server->shm_fd);
+    server->sock_fd = -1;
+    server->shm_fd = -1;
+}
+
+/* get the fd_set according to the unix socket and the peer list */
+void
+ivshmem_server_get_fds(const IvshmemServer *server, fd_set *fds, int *maxfd)
+{
+    IvshmemServerPeer *peer;
+
+    if (server->sock_fd == -1) {
+        return;
+    }
+
+    FD_SET(server->sock_fd, fds);
+    if (server->sock_fd >= *maxfd) {
+        *maxfd = server->sock_fd + 1;
+    }
+
+    QTAILQ_FOREACH(peer, &server->peer_list, next) {
+        FD_SET(peer->sock_fd, fds);
+        if (peer->sock_fd >= *maxfd) {
+            *maxfd = peer->sock_fd + 1;
+        }
+    }
+}
+
+/* process incoming messages on the sockets in fd_set */
+int
+ivshmem_server_handle_fds(IvshmemServer *server, fd_set *fds, int maxfd)
+{
+    IvshmemServerPeer *peer, *peer_next;
+
+    if (server->sock_fd < maxfd && FD_ISSET(server->sock_fd, fds) &&
+        ivshmem_server_handle_new_conn(server) < 0 && errno != EINTR) {
+        IVSHMEM_SERVER_DEBUG(server, "ivshmem_server_handle_new_conn() "
+                             "failed\n");
+        return -1;
+    }
+
+    QTAILQ_FOREACH_SAFE(peer, &server->peer_list, next, peer_next) {
+        /* any message from a peer socket result in a close() */
+        IVSHMEM_SERVER_DEBUG(server, "peer->sock_fd=%d\n", peer->sock_fd);
+        if (peer->sock_fd < maxfd && FD_ISSET(peer->sock_fd, fds)) {
+            ivshmem_server_free_peer(server, peer);
+        }
+    }
+
+    return 0;
+}
+
+/* lookup peer from its id */
+IvshmemServerPeer *
+ivshmem_server_search_peer(IvshmemServer *server, int64_t peer_id)
+{
+    IvshmemServerPeer *peer;
+
+    QTAILQ_FOREACH(peer, &server->peer_list, next) {
+        if (peer->id == peer_id) {
+            return peer;
+        }
+    }
+    return NULL;
+}
diff --git a/contrib/ivshmem2-server/ivshmem2-server.h b/contrib/ivshmem2-server/ivshmem2-server.h
new file mode 100644
index 0000000000..3fd6166577
--- /dev/null
+++ b/contrib/ivshmem2-server/ivshmem2-server.h
@@ -0,0 +1,158 @@
+/*
+ * Copyright 6WIND S.A., 2014
+ * Copyright (c) Siemens AG, 2019
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#ifndef IVSHMEM2_SERVER_H
+#define IVSHMEM2_SERVER_H
+
+/**
+ * The ivshmem server is a daemon that creates a unix socket in listen
+ * mode. The ivshmem clients (qemu or ivshmem-client) connect to this
+ * unix socket. For each client, the server will create some eventfd
+ * (see EVENTFD(2)), one per vector. These fd are transmitted to all
+ * clients using the SCM_RIGHTS cmsg message. Therefore, each client is
+ * able to send a notification to another client without being
+ * "profixied" by the server.
+ *
+ * We use this mechanism to send interruptions between guests.
+ * qemu is able to transform an event on a eventfd into a PCI MSI-x
+ * interruption in the guest.
+ *
+ * The ivshmem server is also able to share the file descriptor
+ * associated to the ivshmem shared memory.
+ */
+
+#include <sys/select.h>
+
+#include "qemu/event_notifier.h"
+#include "qemu/queue.h"
+#include "hw/misc/ivshmem2.h"
+
+/**
+ * Maximum number of notification vectors supported by the server
+ */
+#define IVSHMEM_SERVER_MAX_VECTORS 64
+
+/**
+ * Structure storing a peer
+ *
+ * Each time a client connects to an ivshmem server, a new
+ * IvshmemServerPeer structure is created. This peer and all its
+ * vectors are advertised to all connected clients through the connected
+ * unix sockets.
+ */
+typedef struct IvshmemServerPeer {
+    QTAILQ_ENTRY(IvshmemServerPeer) next;    /**< next in list*/
+    int sock_fd;                             /**< connected unix sock */
+    int64_t id;                              /**< the id of the peer */
+    EventNotifier vectors[IVSHMEM_SERVER_MAX_VECTORS]; /**< one per vector */
+    unsigned vectors_count;                  /**< number of vectors */
+} IvshmemServerPeer;
+
+/**
+ * Structure describing ivshmem server arguments
+ */
+typedef struct IvshmemServerArgs {
+    bool verbose;                   /**< true to enable verbose mode */
+    const char *unix_socket_path;   /**< pointer to unix socket file name */
+    const char *shm_path;           /**< Path to the shared memory; path
+                                         corresponds to a POSIX shm name or a
+                                         hugetlbfs mount point. */
+    bool use_shm_open;              /**< true to use shm_open, false for
+                                         file-backed shared memory */
+    uint64_t shm_size;              /**< total size of shared memory */
+    uint64_t output_section_size;   /**< size of each output section */
+    unsigned max_peers;             /**< maximum number of peers */
+    unsigned vectors;               /**< interrupt vectors per client */
+    unsigned protocol;              /**< protocol advertised to all clients */
+} IvshmemServerArgs;
+
+/**
+ * Structure describing an ivshmem server
+ *
+ * This structure stores all information related to our server: the name
+ * of the server unix socket and the list of connected peers.
+ */
+typedef struct IvshmemServer {
+    IvshmemServerArgs args;          /**< server arguments */
+    int sock_fd;                     /**< unix sock file descriptor */
+    int shm_fd;                      /**< shm file descriptor */
+    uint32_t *state_table;           /**< mapped state table */
+    QTAILQ_HEAD(, IvshmemServerPeer) peer_list; /**< list of peers */
+} IvshmemServer;
+
+/**
+ * Initialize an ivshmem server
+ *
+ * @server:         A pointer to an uninitialized IvshmemServer structure
+ */
+void ivshmem_server_init(IvshmemServer *server);
+
+/**
+ * Open the shm, then create and bind to the unix socket
+ *
+ * @server: The pointer to the initialized IvshmemServer structure
+ *
+ * Returns: 0 on success, or a negative value on error
+ */
+int ivshmem_server_start(IvshmemServer *server);
+
+/**
+ * Close the server
+ *
+ * Close connections to all clients, close the unix socket and the
+ * shared memory file descriptor. The structure remains initialized, so
+ * it is possible to call ivshmem_server_start() again after a call to
+ * ivshmem_server_close().
+ *
+ * @server: The ivshmem server
+ */
+void ivshmem_server_close(IvshmemServer *server);
+
+/**
+ * Fill a fd_set with file descriptors to be monitored
+ *
+ * This function will fill a fd_set with all file descriptors that must
+ * be polled (unix server socket and peers unix socket). The function
+ * will not initialize the fd_set, it is up to the caller to do it.
+ *
+ * @server: The ivshmem server
+ * @fds:    The fd_set to be updated
+ * @maxfd:  Must be set to the max file descriptor + 1 in fd_set. This value is
+ *          updated if this function adds a greater fd in fd_set.
+ */
+void
+ivshmem_server_get_fds(const IvshmemServer *server, fd_set *fds, int *maxfd);
+
+/**
+ * Read and handle new messages
+ *
+ * Given a fd_set (for instance filled by a call to select()), handle
+ * incoming messages from peers.
+ *
+ * @server: The ivshmem server
+ * @fds:    The fd_set containing the file descriptors to be checked. Note that
+ *          file descriptors that are not related to our server are ignored.
+ * @maxfd:  The maximum fd in fd_set, plus one.
+ *
+ * Returns: 0 on success, or a negative value on error
+ */
+int ivshmem_server_handle_fds(IvshmemServer *server, fd_set *fds, int maxfd);
+
+/**
+ * Search a peer from its identifier
+ *
+ * @server:  The ivshmem server
+ * @peer_id: The identifier of the peer structure
+ *
+ * Returns:  The peer structure, or NULL if not found
+ */
+IvshmemServerPeer *
+ivshmem_server_search_peer(IvshmemServer *server, int64_t peer_id);
+
+#endif /* IVSHMEM2_SERVER_H */
diff --git a/contrib/ivshmem2-server/main.c b/contrib/ivshmem2-server/main.c
new file mode 100644
index 0000000000..35cd6fca0f
--- /dev/null
+++ b/contrib/ivshmem2-server/main.c
@@ -0,0 +1,313 @@
+/*
+ * Copyright 6WIND S.A., 2014
+ * Copyright (c) Siemens AG, 2019
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+#include "qemu/option.h"
+#include "ivshmem2-server.h"
+
+#define IVSHMEM_SERVER_DEFAULT_FOREGROUND     0
+#define IVSHMEM_SERVER_DEFAULT_PID_FILE       "/var/run/ivshmem-server.pid"
+
+#define IVSHMEM_SERVER_DEFAULT_VERBOSE        0
+#define IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "/tmp/ivshmem_socket"
+#define IVSHMEM_SERVER_DEFAULT_SHM_PATH       "ivshmem"
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
+#define IVSHMEM_SERVER_DEFAULT_OUTPUT_SEC_SZ  0
+#define IVSHMEM_SERVER_DEFAULT_MAX_PEERS      2
+#define IVSHMEM_SERVER_DEFAULT_VECTORS        1
+#define IVSHMEM_SERVER_DEFAULT_PROTOCOL       0
+
+/* used to quit on signal SIGTERM */
+static int ivshmem_server_quit;
+
+static bool foreground = IVSHMEM_SERVER_DEFAULT_FOREGROUND;
+static const char *pid_file = IVSHMEM_SERVER_DEFAULT_PID_FILE;
+
+static void
+ivshmem_server_usage(const char *progname)
+{
+    printf("Usage: %s [OPTION]...\n"
+           "  -h: show this help\n"
+           "  -v: verbose mode\n"
+           "  -F: foreground mode (default is to daemonize)\n"
+           "  -p <pid-file>: path to the PID file (used in daemon mode only)\n"
+           "     default " IVSHMEM_SERVER_DEFAULT_PID_FILE "\n"
+           "  -S <unix-socket-path>: path to the unix socket to listen to\n"
+           "     default " IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "\n"
+           "  -M <shm-name>: POSIX shared memory object to use\n"
+           "     default " IVSHMEM_SERVER_DEFAULT_SHM_PATH "\n"
+           "  -m <dir-name>: where to create shared memory\n"
+           "  -l <size>: size of shared memory in bytes\n"
+           "     suffixes K, M and G can be used, e.g. 1K means 1024\n"
+           "     default %u\n"
+           "  -o <size>: size of each output section in bytes "
+                "(suffixes supported)\n"
+           "     default %u\n"
+           "  -n <peers>: maximum number of peers\n"
+           "     default %u\n"
+           "  -V <vectors>: number of vectors\n"
+           "     default %u\n"
+           "  -P <protocol>: 16-bit protocol to be advertised\n"
+           "     default 0x%04x\n"
+           "     When using virtio (0x8000...0xffff), only two peers are "
+           "supported, peer 0\n"
+           "     will become backend, peer 1 frontend\n",
+           progname, IVSHMEM_SERVER_DEFAULT_SHM_SIZE,
+           IVSHMEM_SERVER_DEFAULT_OUTPUT_SEC_SZ,
+           IVSHMEM_SERVER_DEFAULT_MAX_PEERS, IVSHMEM_SERVER_DEFAULT_VECTORS,
+           IVSHMEM_SERVER_DEFAULT_PROTOCOL);
+}
+
+static void
+ivshmem_server_help(const char *progname)
+{
+    fprintf(stderr, "Try '%s -h' for more information.\n", progname);
+}
+
+/* parse the program arguments, exit on error */
+static void
+ivshmem_server_parse_args(IvshmemServerArgs *args, int argc, char *argv[])
+{
+    int c;
+    unsigned long long v;
+    Error *err = NULL;
+
+    while ((c = getopt(argc, argv, "hvFp:S:m:M:l:o:n:V:P:")) != -1) {
+
+        switch (c) {
+        case 'h': /* help */
+            ivshmem_server_usage(argv[0]);
+            exit(0);
+            break;
+
+        case 'v': /* verbose */
+            args->verbose = 1;
+            break;
+
+        case 'F': /* foreground */
+            foreground = 1;
+            break;
+
+        case 'p': /* pid file */
+            pid_file = optarg;
+            break;
+
+        case 'S': /* unix socket path */
+            args->unix_socket_path = optarg;
+            break;
+
+        case 'M': /* shm name */
+        case 'm': /* dir name */
+            args->shm_path = optarg;
+            args->use_shm_open = c == 'M';
+            break;
+
+        case 'l': /* shm size */
+            parse_option_size("shm_size", optarg, &args->shm_size, &err);
+            if (err) {
+                error_report_err(err);
+                ivshmem_server_help(argv[0]);
+                exit(1);
+            }
+            break;
+
+        case 'o': /* output section size */
+            parse_option_size("output_section_size", optarg,
+                              &args->output_section_size, &err);
+            if (err) {
+                error_report_err(err);
+                ivshmem_server_help(argv[0]);
+                exit(1);
+            }
+            break;
+
+        case 'n': /* maximum number of peers */
+            if (parse_uint_full(optarg, &v, 0) < 0) {
+                fprintf(stderr, "cannot parse max-peers\n");
+                ivshmem_server_help(argv[0]);
+                exit(1);
+            }
+            args->max_peers = v;
+            break;
+
+        case 'V': /* number of vectors */
+            if (parse_uint_full(optarg, &v, 0) < 0) {
+                fprintf(stderr, "cannot parse vectors\n");
+                ivshmem_server_help(argv[0]);
+                exit(1);
+            }
+            args->vectors = v;
+            break;
+
+        case 'P': /* protocol */
+            if (parse_uint_full(optarg, &v, 0) < 0) {
+                fprintf(stderr, "cannot parse protocol\n");
+                ivshmem_server_help(argv[0]);
+                exit(1);
+            }
+            args->protocol = v;
+            break;
+
+        default:
+            ivshmem_server_usage(argv[0]);
+            exit(1);
+            break;
+        }
+    }
+
+    if (args->vectors > IVSHMEM_SERVER_MAX_VECTORS) {
+        fprintf(stderr, "too many requested vectors (max is %d)\n",
+                IVSHMEM_SERVER_MAX_VECTORS);
+        ivshmem_server_help(argv[0]);
+        exit(1);
+    }
+
+    if (args->protocol >= 0x8000 && args->max_peers > 2) {
+        fprintf(stderr, "virtio protocols only support 2 peers\n");
+        ivshmem_server_help(argv[0]);
+        exit(1);
+    }
+
+    if (args->verbose == 1 && foreground == 0) {
+        fprintf(stderr, "cannot use verbose in daemon mode\n");
+        ivshmem_server_help(argv[0]);
+        exit(1);
+    }
+}
+
+/* wait for events on listening server unix socket and connected client
+ * sockets */
+static int
+ivshmem_server_poll_events(IvshmemServer *server)
+{
+    fd_set fds;
+    int ret = 0, maxfd;
+
+    while (!ivshmem_server_quit) {
+
+        FD_ZERO(&fds);
+        maxfd = 0;
+        ivshmem_server_get_fds(server, &fds, &maxfd);
+
+        ret = select(maxfd, &fds, NULL, NULL, NULL);
+
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            }
+
+            fprintf(stderr, "select error: %s\n", strerror(errno));
+            break;
+        }
+        if (ret == 0) {
+            continue;
+        }
+
+        if (ivshmem_server_handle_fds(server, &fds, maxfd) < 0) {
+            fprintf(stderr, "ivshmem_server_handle_fds() failed\n");
+            break;
+        }
+    }
+
+    return ret;
+}
+
+static void
+ivshmem_server_quit_cb(int signum)
+{
+    ivshmem_server_quit = 1;
+}
+
+int
+main(int argc, char *argv[])
+{
+    IvshmemServer server = {
+        .args = {
+            .verbose = IVSHMEM_SERVER_DEFAULT_VERBOSE,
+            .unix_socket_path = IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH,
+            .shm_path = IVSHMEM_SERVER_DEFAULT_SHM_PATH,
+            .use_shm_open = true,
+            .shm_size = IVSHMEM_SERVER_DEFAULT_SHM_SIZE,
+            .output_section_size = IVSHMEM_SERVER_DEFAULT_OUTPUT_SEC_SZ,
+            .max_peers = IVSHMEM_SERVER_DEFAULT_MAX_PEERS,
+            .vectors = IVSHMEM_SERVER_DEFAULT_VECTORS,
+            .protocol = IVSHMEM_SERVER_DEFAULT_PROTOCOL,
+        },
+    };
+    struct sigaction sa, sa_quit;
+    int ret = 1;
+
+    /*
+     * Do not remove this notice without adding proper error handling!
+     * Start with handling ivshmem_server_send_one_msg() failure.
+     */
+    printf("*** Example code, do not use in production ***\n");
+
+    /* parse arguments, will exit on error */
+    ivshmem_server_parse_args(&server.args, argc, argv);
+
+    /* Ignore SIGPIPE, see this link for more info:
+     * http://www.mail-archive.com/libevent-users@monkey.org/msg01606.html */
+    sa.sa_handler = SIG_IGN;
+    sa.sa_flags = 0;
+    if (sigemptyset(&sa.sa_mask) == -1 ||
+        sigaction(SIGPIPE, &sa, 0) == -1) {
+        perror("failed to ignore SIGPIPE; sigaction");
+        goto err;
+    }
+
+    sa_quit.sa_handler = ivshmem_server_quit_cb;
+    sa_quit.sa_flags = 0;
+    if (sigemptyset(&sa_quit.sa_mask) == -1 ||
+        sigaction(SIGTERM, &sa_quit, 0) == -1 ||
+        sigaction(SIGINT, &sa_quit, 0) == -1) {
+        perror("failed to add signal handler; sigaction");
+        goto err;
+    }
+
+    /* init the ivshms structure */
+    ivshmem_server_init(&server);
+
+    /* start the ivshmem server (open shm & unix socket) */
+    if (ivshmem_server_start(&server) < 0) {
+        fprintf(stderr, "cannot bind\n");
+        goto err;
+    }
+
+    /* daemonize if asked to */
+    if (!foreground) {
+        FILE *fp;
+
+        if (qemu_daemon(1, 1) < 0) {
+            fprintf(stderr, "cannot daemonize: %s\n", strerror(errno));
+            goto err_close;
+        }
+
+        /* write pid file */
+        fp = fopen(pid_file, "w");
+        if (fp == NULL) {
+            fprintf(stderr, "cannot write pid file: %s\n", strerror(errno));
+            goto err_close;
+        }
+
+        fprintf(fp, "%d\n", (int) getpid());
+        fclose(fp);
+    }
+
+    ivshmem_server_poll_events(&server);
+    fprintf(stdout, "server disconnected\n");
+    ret = 0;
+
+err_close:
+    ivshmem_server_close(&server);
+err:
+    return ret;
+}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/349ba45e162e248a49d83a5ae0cebeb8b7feb032.1573477032.git.jan.kiszka%40siemens.com.
