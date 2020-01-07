Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7VO2LYAKGQE6OOVK6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C536132909
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Jan 2020 15:36:47 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id y125sf3263023wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Jan 2020 06:36:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578407806; cv=pass;
        d=google.com; s=arc-20160816;
        b=l8mc0QxPsfd0MdzpjeCsAf7UU24Zl0Zu+P7WGFOQ5Ym8h/xGc5wkTGtseUB0WYr1IA
         KBMDd1x9CqJ1UyGh2CF1t/jYPloKAeoOpy8m/smnr09mgrylC1FQZ7WOm9Zle+SsCnWG
         SxkUKaSLXGkancNojdqHa/ETxngn75rt9It5MWxycaApnkDNVGPzS83dDE/mmRgQ6iim
         LqO4//XVZUVZirVkQLINntAoBBHv7/RreR4lOWnQZmGRttTDCraopGBybiSrNxuTStQI
         kK2t0ivpdoJ2n6/dEqXWRL8NdpnqGt2jX050t1uDrtoxQ21by4Ck3RjxoEfqQDRhwaNo
         UJxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=VcngD9TBNm/khvaKWtZT5cEsbWgSbIKUb3Fr6AI6VbQ=;
        b=jNfnYK8jiAV188g3BdU4DOpjdBgh9LuQQyRp+1cweN5fOgA6jRB7F7zefeizS0Y2PJ
         lRSGEV9pou4EegPy5GAqRiso21zVldbsq78nkgxYfybI+SDj+FZBTXJhqt5+mEXy7HfT
         mkpMLPE50v1FbOiL5Jf4o0UbPohtLi60PGDFTy42BGHVAD9HWShVXsbQqdArDrcVCji+
         /oSDtssnf8ZPl+BHVrd5BKAVWtRWf3Bgu/dBuxGipx13zZyixz9ipo1G5BmHMrLCHPCc
         YjNs0Zd/3Axj96RZYER2XdWa7nyENIvqhWraLEyuEUYCLvbF+F6lzymfuPvK0D6DODbs
         lUog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VcngD9TBNm/khvaKWtZT5cEsbWgSbIKUb3Fr6AI6VbQ=;
        b=VtNmz33dT7zUjiZd7TcDs3H3cOhSXxo22cEUBfc+wHCjO87lLdY2pm1JUhyG3Q/mRx
         uskyl7pU2LQ4gYP0eSTBzP26T45jhX11JbCkH50VoKTQ8Xfvma8+0y/B5r1VUzjM+L8j
         D9CrR8FAumRxujxiG7+onIPwqsF4tLdtbqM1xw+WF499G+i4sb2NONwC/gWsU87yLIYR
         HHC0dxmnieaYvXXXJnRq2k3CD5lTpj8RV1yJCbpckqUsukFtyboQBoX7DMpwdnW5wszm
         OpOQsAaPCqtDpffFt4Exu/B+SEVvAxuuvmKPbiPHmpemxq7eAfPvviGY+DBM1txp39uD
         dB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VcngD9TBNm/khvaKWtZT5cEsbWgSbIKUb3Fr6AI6VbQ=;
        b=lCRuPIroNmirU9fm0xtuCjpLVcHHfcrTUC25z94VkGgGFIPlj1E8IWEI0oCHxcDpz2
         ufm2pTovSLGRSIOiJ4z6GVkFaMI70wpNTKUkdbfsFWNZQpmf9Gdp2pFHBtxFEenebWLb
         DShefBXQT2v6jJ0tsDWN/EYrqIbAwE0gnr+F+U024CFAi25KRIJbLq1Aj5O3Yyw9FJlV
         jxAhYhjdazffAOe23/b3WtSIdB/VWWakYQlU4TURnqgWWnaVUhLh7CeijOMSFVluctiO
         1SQRGVY3JlsbU1dzi7bDEEi8o5ElJC+ClGVdyfBO+a9k3IdJMlzorsILQP4ZhRyrnx4t
         WswQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXFBYQTlaxdtH8bDIEeEI3N39i8CZZT28w88AprmzxxG43v4CF1
	5WzG/mKC04LrXWDNnlO5v7k=
X-Google-Smtp-Source: APXvYqyKbPH5S1lVlJTfk6buXyA9apg9At2r7e8+L0P3RXOdGW30Z7xXvvMjS+t2NXsUJHnEXr7hDg==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr79086329wrs.222.1578407806629;
        Tue, 07 Jan 2020 06:36:46 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6912:: with SMTP id t18ls13956144wru.7.gmail; Tue, 07
 Jan 2020 06:36:45 -0800 (PST)
X-Received: by 2002:adf:db41:: with SMTP id f1mr112418973wrj.392.1578407805820;
        Tue, 07 Jan 2020 06:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578407805; cv=none;
        d=google.com; s=arc-20160816;
        b=IMsxMzoc6nNhfds7e1T57ovwi2Mzh5pN9Y61shWraQ32GsRAaZBV0RrsyTKvZR0lpW
         upxguzIy8YQQ5koWrkgFnVoJ7L6M0Lk14xr4Yx8RZfj2/dvq7GbeBzRkB32eUznEqtig
         lolCl1p9KX52Q5+STCbDKtqBk9B4kuPGbHbhIdPnap/gxNySIdk4iz5a56TXbAHzcmzT
         mdLw3t1OA2GruvnTKpCf3o+Mi/MmJ98Q7dDSz8LseLwxXwlyuqtLcuqYPo0r3T+C2W1h
         1ILtl6/SuI4FAT+CfDgXaQDjbOX0a3Hik2HREy8b8u6j9+Vg3kA0CpOXYgt/apXqDziV
         tCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:cc:to:from;
        bh=WY/onnM5Iswc/wY6kPlu8TkYKAxVWv1+JPZcUKElmKI=;
        b=G7Qf0V5WndNK7dGQFEgpxVLNb2dPjZta9DH5/JbSrHrowiikF91dCBDtq7yzMRDp5h
         lrVrQdC5FiINhG7syn8q8VwVTjzCr3bmGvHD87ojV2LLZa/yaxLJG7ZIt9eBsDolo4Si
         TQLqaF9DccYs82Z4kdv0SH+mX/I0F+OnK6EzCl0CTKlgOzBYbam2e4McH0vlpUVvdSrL
         zJCusqFb3zC7+gV1ZZVquk04g1p41UqySkVm1wP9y1YZ0xkoGLtY5yzDLeXqUJys9qoK
         iOWA1ecz52+WcGimrTFzzwq0R1oa3hSlcGdHKjZsZx0/0e0tQTR0I36x2Y5jpXJHAQSk
         kfMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t131si797448wmb.1.2020.01.07.06.36.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 06:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 007EaiXc000339
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2020 15:36:44 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 007Eai7R011484;
	Tue, 7 Jan 2020 15:36:44 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [RFC][PATCH v2 1/3] hw/misc: Add implementation of ivshmem revision 2 device
Date: Tue,  7 Jan 2020 15:36:40 +0100
Message-Id: <5542adccc5bda38da2cd0f46398850dc4ec31f2a.1578407802.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578407802.git.jan.kiszka@siemens.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578407802.git.jan.kiszka@siemens.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This adds a reimplementation of ivshmem in its new revision 2 as
separate device. The goal of this is not to enable sharing with v1,
rather to allow explore the properties and potential limitation of the
new version prior to discussing its integration with the existing code.

v2 always requires a server to interconnect two more more QEMU
instances because it provides signaling between peers unconditionally.
Therefore, only the interconnecting chardev, master mode, and the usage
of ioeventfd can be configured at device level. All other parameters are
defined by the server instance.

A new server protocol is introduced along this. Its primary difference
is the introduction of a single welcome message that contains all peer
parameters, rather than a series of single-word messages pushing them
piece by piece.

A complicating difference in interrupt handling, compare to v1, is the
auto-disable mode of v2: When this is active, interrupt delivery is
disabled by the device after each interrupt event. This prevents the
usage of irqfd on the receiving side, but it lowers the handling cost
for guests that implemented interrupt throttling this way (specifically
when exposing the device via UIO).

No changes have been made to the ivshmem device regarding migration:
Only the master can live-migrate, slave peers have to hot-unplug the
device first.

The details of the device model will be specified in a succeeding
commit. Drivers for this device can currently be found under

http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2

To instantiate a ivshmem v2 device, just add

 ... -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem \
     -device ivshmem,chardev=ivshmem

provided the server opened its socket under the default path.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/misc/Makefile.objs      |    2 +-
 hw/misc/ivshmem2.c         | 1085 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/ivshmem2.h |   48 ++
 include/hw/pci/pci_ids.h   |    2 +
 4 files changed, 1136 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/ivshmem2.c
 create mode 100644 include/hw/misc/ivshmem2.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index ba898a5781..90a4a6608c 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -26,7 +26,7 @@ common-obj-$(CONFIG_PUV3) += puv3_pm.o
 
 common-obj-$(CONFIG_MACIO) += macio/
 
-common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
+common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o ivshmem2.o
 
 common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
 common-obj-$(CONFIG_NSERIES) += cbus.o
diff --git a/hw/misc/ivshmem2.c b/hw/misc/ivshmem2.c
new file mode 100644
index 0000000000..d5f88ed0e9
--- /dev/null
+++ b/hw/misc/ivshmem2.c
@@ -0,0 +1,1085 @@
+/*
+ * Inter-VM Shared Memory PCI device, version 2.
+ *
+ * Copyright (c) Siemens AG, 2019
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * Based on ivshmem.c by Cam Macdonell <cam@cs.ualberta.ca>
+ *
+ * This code is licensed under the GNU GPL v2.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+#include "hw/hw.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/qdev-properties.h"
+#include "sysemu/kvm.h"
+#include "migration/blocker.h"
+#include "migration/vmstate.h"
+#include "qemu/error-report.h"
+#include "qemu/event_notifier.h"
+#include "qemu/module.h"
+#include "qom/object_interfaces.h"
+#include "chardev/char-fe.h"
+#include "sysemu/qtest.h"
+#include "qapi/visitor.h"
+
+#include "hw/misc/ivshmem2.h"
+
+#define PCI_VENDOR_ID_IVSHMEM   PCI_VENDOR_ID_SIEMENS
+#define PCI_DEVICE_ID_IVSHMEM   0x4106
+
+#define IVSHMEM_MAX_PEERS       UINT16_MAX
+#define IVSHMEM_IOEVENTFD       0
+#define IVSHMEM_MSI             1
+
+#define IVSHMEM_REG_BAR_SIZE    0x1000
+
+#define IVSHMEM_REG_ID          0x00
+#define IVSHMEM_REG_MAX_PEERS   0x04
+#define IVSHMEM_REG_INT_CTRL    0x08
+#define IVSHMEM_REG_DOORBELL    0x0c
+#define IVSHMEM_REG_STATE       0x10
+
+#define IVSHMEM_INT_ENABLE      0x1
+
+#define IVSHMEM_ONESHOT_MODE    0x1
+
+#define IVSHMEM_DEBUG 0
+#define IVSHMEM_DPRINTF(fmt, ...)                       \
+    do {                                                \
+        if (IVSHMEM_DEBUG) {                            \
+            printf("IVSHMEM: " fmt, ## __VA_ARGS__);    \
+        }                                               \
+    } while (0)
+
+#define TYPE_IVSHMEM "ivshmem"
+#define IVSHMEM(obj) \
+    OBJECT_CHECK(IVShmemState, (obj), TYPE_IVSHMEM)
+
+typedef struct Peer {
+    int nb_eventfds;
+    EventNotifier *eventfds;
+} Peer;
+
+typedef struct MSIVector {
+    PCIDevice *pdev;
+    int virq;
+    bool unmasked;
+} MSIVector;
+
+typedef struct IVShmemVndrCap {
+    uint8_t id;
+    uint8_t next;
+    uint8_t length;
+    uint8_t priv_ctrl;
+    uint32_t state_tab_sz;
+    uint64_t rw_section_sz;
+    uint64_t output_section_sz;
+} IVShmemVndrCap;
+
+typedef struct IVShmemState {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+
+    uint32_t features;
+
+    CharBackend server_chr;
+
+    /* registers */
+    uint8_t *priv_ctrl;
+    uint32_t vm_id;
+    uint32_t intctrl;
+    uint32_t state;
+
+    /* BARs */
+    MemoryRegion ivshmem_mmio; /* BAR 0 (registers) */
+    MemoryRegion ivshmem_bar2; /* BAR 2 (shared memory) */
+
+    void *shmem;
+    size_t shmem_sz;
+    size_t output_section_sz;
+
+    MemoryRegion state_tab;
+    MemoryRegion rw_section;
+    MemoryRegion input_sections;
+    MemoryRegion output_section;
+
+    /* interrupt support */
+    Peer *peers;
+    int nb_peers;               /* space in @peers[] */
+    uint32_t max_peers;
+    uint32_t vectors;
+    MSIVector *msi_vectors;
+
+    uint8_t msg_buf[32];        /* buffer for receiving server messages */
+    int msg_buffered_bytes;     /* #bytes in @msg_buf */
+
+    uint32_t protocol;
+
+    /* migration stuff */
+    OnOffAuto master;
+    Error *migration_blocker;
+} IVShmemState;
+
+static void ivshmem_enable_irqfd(IVShmemState *s);
+static void ivshmem_disable_irqfd(IVShmemState *s);
+
+static inline uint32_t ivshmem_has_feature(IVShmemState *ivs,
+                                           unsigned int feature) {
+    return (ivs->features & (1 << feature));
+}
+
+static inline bool ivshmem_is_master(IVShmemState *s)
+{
+    assert(s->master != ON_OFF_AUTO_AUTO);
+    return s->master == ON_OFF_AUTO_ON;
+}
+
+static bool ivshmem_irqfd_usable(IVShmemState *s)
+{
+    PCIDevice *pdev = PCI_DEVICE(s);
+
+    return (s->intctrl & IVSHMEM_INT_ENABLE) && msix_enabled(pdev) &&
+        !(*s->priv_ctrl & IVSHMEM_ONESHOT_MODE);
+}
+
+static void ivshmem_update_irqfd(IVShmemState *s, bool was_usable)
+{
+    bool is_usable = ivshmem_irqfd_usable(s);
+
+    if (kvm_msi_via_irqfd_enabled()) {
+        if (!was_usable && is_usable) {
+            ivshmem_enable_irqfd(s);
+        } else if (was_usable && !is_usable) {
+            ivshmem_disable_irqfd(s);
+        }
+    }
+}
+
+static void ivshmem_write_intctrl(IVShmemState *s, uint32_t new_state)
+{
+    bool was_usable = ivshmem_irqfd_usable(s);
+
+    s->intctrl = new_state & IVSHMEM_INT_ENABLE;
+    ivshmem_update_irqfd(s, was_usable);
+}
+
+static void ivshmem_write_state(IVShmemState *s, uint32_t new_state)
+{
+    uint32_t *state_table = s->shmem;
+    int peer;
+
+    state_table[s->vm_id] = new_state;
+    smp_mb();
+
+    if (s->state != new_state) {
+        s->state = new_state;
+        for (peer = 0; peer < s->nb_peers; peer++) {
+            if (peer != s->vm_id && s->peers[peer].nb_eventfds > 0) {
+                event_notifier_set(&s->peers[peer].eventfds[0]);
+            }
+        }
+    }
+}
+
+static void ivshmem_io_write(void *opaque, hwaddr addr,
+                             uint64_t val, unsigned size)
+{
+    IVShmemState *s = opaque;
+
+    uint16_t dest = val >> 16;
+    uint16_t vector = val & 0xff;
+
+    addr &= 0xfc;
+
+    IVSHMEM_DPRINTF("writing to addr " TARGET_FMT_plx "\n", addr);
+    switch (addr) {
+    case IVSHMEM_REG_INT_CTRL:
+        ivshmem_write_intctrl(s, val);
+        break;
+
+    case IVSHMEM_REG_DOORBELL:
+        /* check that dest VM ID is reasonable */
+        if (dest >= s->nb_peers) {
+            IVSHMEM_DPRINTF("Invalid destination VM ID (%d)\n", dest);
+            break;
+        }
+
+        /* check doorbell range */
+        if (vector < s->peers[dest].nb_eventfds) {
+            IVSHMEM_DPRINTF("Notifying VM %d on vector %d\n", dest, vector);
+            event_notifier_set(&s->peers[dest].eventfds[vector]);
+        } else {
+            IVSHMEM_DPRINTF("Invalid destination vector %d on VM %d\n",
+                            vector, dest);
+        }
+        break;
+
+    case IVSHMEM_REG_STATE:
+        ivshmem_write_state(s, val);
+        break;
+
+    default:
+        IVSHMEM_DPRINTF("Unhandled write " TARGET_FMT_plx "\n", addr);
+    }
+}
+
+static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    IVShmemState *s = opaque;
+    uint32_t ret;
+
+    switch (addr) {
+    case IVSHMEM_REG_ID:
+        ret = s->vm_id;
+        break;
+
+    case IVSHMEM_REG_MAX_PEERS:
+        ret = s->max_peers;
+        break;
+
+    case IVSHMEM_REG_INT_CTRL:
+        ret = s->intctrl;
+        break;
+
+    case IVSHMEM_REG_STATE:
+        ret = s->state;
+        break;
+
+    default:
+        IVSHMEM_DPRINTF("why are we reading " TARGET_FMT_plx "\n", addr);
+        ret = 0;
+    }
+
+    return ret;
+}
+
+static const MemoryRegionOps ivshmem_mmio_ops = {
+    .read = ivshmem_io_read,
+    .write = ivshmem_io_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void ivshmem_vector_notify(void *opaque)
+{
+    MSIVector *entry = opaque;
+    PCIDevice *pdev = entry->pdev;
+    IVShmemState *s = IVSHMEM(pdev);
+    int vector = entry - s->msi_vectors;
+    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
+
+    if (!event_notifier_test_and_clear(n) ||
+        !(s->intctrl & IVSHMEM_INT_ENABLE)) {
+        return;
+    }
+
+    IVSHMEM_DPRINTF("interrupt on vector %p %d\n", pdev, vector);
+    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
+        if (msix_enabled(pdev)) {
+            msix_notify(pdev, vector);
+        }
+    } else if (pdev->config[PCI_INTERRUPT_PIN]) {
+        pci_set_irq(pdev, 1);
+        pci_set_irq(pdev, 0);
+    }
+    if (*s->priv_ctrl & IVSHMEM_ONESHOT_MODE) {
+        s->intctrl &= ~IVSHMEM_INT_ENABLE;
+    }
+}
+
+static int ivshmem_irqfd_vector_unmask(PCIDevice *dev, unsigned vector,
+                                       MSIMessage msg)
+{
+    IVShmemState *s = IVSHMEM(dev);
+    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
+    MSIVector *v = &s->msi_vectors[vector];
+    int ret;
+
+    IVSHMEM_DPRINTF("vector unmask %p %d\n", dev, vector);
+    if (!v->pdev) {
+        error_report("ivshmem: vector %d route does not exist", vector);
+        return -EINVAL;
+    }
+    assert(!v->unmasked);
+
+    ret = kvm_irqchip_add_msi_route(kvm_state, vector, dev);
+    if (ret < 0) {
+        error_report("kvm_irqchip_add_msi_route failed");
+        return ret;
+    }
+    v->virq = ret;
+    kvm_irqchip_commit_routes(kvm_state);
+
+    ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, v->virq);
+    if (ret < 0) {
+        error_report("kvm_irqchip_add_irqfd_notifier_gsi failed");
+        return ret;
+    }
+    v->unmasked = true;
+
+    return 0;
+}
+
+static void ivshmem_irqfd_vector_mask(PCIDevice *dev, unsigned vector)
+{
+    IVShmemState *s = IVSHMEM(dev);
+    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
+    MSIVector *v = &s->msi_vectors[vector];
+    int ret;
+
+    IVSHMEM_DPRINTF("vector mask %p %d\n", dev, vector);
+    if (!v->pdev) {
+        error_report("ivshmem: vector %d route does not exist", vector);
+        return;
+    }
+    assert(v->unmasked);
+
+    ret = kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, v->virq);
+    if (ret < 0) {
+        error_report("remove_irqfd_notifier_gsi failed");
+        return;
+    }
+    kvm_irqchip_release_virq(kvm_state, v->virq);
+
+    v->unmasked = false;
+}
+
+static void ivshmem_irqfd_vector_poll(PCIDevice *dev,
+                                      unsigned int vector_start,
+                                      unsigned int vector_end)
+{
+    IVShmemState *s = IVSHMEM(dev);
+    unsigned int vector;
+
+    IVSHMEM_DPRINTF("vector poll %p %d-%d\n", dev, vector_start, vector_end);
+
+    vector_end = MIN(vector_end, s->vectors);
+
+    for (vector = vector_start; vector < vector_end; vector++) {
+        EventNotifier *notifier = &s->peers[s->vm_id].eventfds[vector];
+
+        if (!msix_is_masked(dev, vector)) {
+            continue;
+        }
+
+        if (event_notifier_test_and_clear(notifier)) {
+            msix_set_pending(dev, vector);
+        }
+    }
+}
+
+static void ivshmem_watch_vector_notifier(IVShmemState *s, int vector)
+{
+    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
+    int eventfd = event_notifier_get_fd(n);
+
+    assert(!s->msi_vectors[vector].pdev);
+    s->msi_vectors[vector].pdev = PCI_DEVICE(s);
+
+    qemu_set_fd_handler(eventfd, ivshmem_vector_notify,
+                        NULL, &s->msi_vectors[vector]);
+}
+
+static void ivshmem_unwatch_vector_notifier(IVShmemState *s, int vector)
+{
+    EventNotifier *n = &s->peers[s->vm_id].eventfds[vector];
+    int eventfd = event_notifier_get_fd(n);
+
+    if (!s->msi_vectors[vector].pdev) {
+        return;
+    }
+
+    qemu_set_fd_handler(eventfd, NULL, NULL, NULL);
+
+    s->msi_vectors[vector].pdev = NULL;
+}
+
+static void ivshmem_add_eventfd(IVShmemState *s, int posn, int i)
+{
+    memory_region_add_eventfd(&s->ivshmem_mmio,
+                              IVSHMEM_REG_DOORBELL,
+                              4,
+                              true,
+                              (posn << 16) | i,
+                              &s->peers[posn].eventfds[i]);
+}
+
+static void ivshmem_del_eventfd(IVShmemState *s, int posn, int i)
+{
+    memory_region_del_eventfd(&s->ivshmem_mmio,
+                              IVSHMEM_REG_DOORBELL,
+                              4,
+                              true,
+                              (posn << 16) | i,
+                              &s->peers[posn].eventfds[i]);
+}
+
+static void close_peer_eventfds(IVShmemState *s, int posn)
+{
+    int i, n;
+
+    assert(posn >= 0 && posn < s->nb_peers);
+    n = s->peers[posn].nb_eventfds;
+
+    if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD)) {
+        memory_region_transaction_begin();
+        for (i = 0; i < n; i++) {
+            ivshmem_del_eventfd(s, posn, i);
+        }
+        memory_region_transaction_commit();
+    }
+
+    for (i = 0; i < n; i++) {
+        event_notifier_cleanup(&s->peers[posn].eventfds[i]);
+    }
+
+    g_free(s->peers[posn].eventfds);
+    s->peers[posn].nb_eventfds = 0;
+}
+
+static void resize_peers(IVShmemState *s, int nb_peers)
+{
+    int old_nb_peers = s->nb_peers;
+    int i;
+
+    assert(nb_peers > old_nb_peers);
+    IVSHMEM_DPRINTF("bumping storage to %d peers\n", nb_peers);
+
+    s->peers = g_realloc(s->peers, nb_peers * sizeof(Peer));
+    s->nb_peers = nb_peers;
+
+    for (i = old_nb_peers; i < nb_peers; i++) {
+        s->peers[i].eventfds = NULL;
+        s->peers[i].nb_eventfds = 0;
+    }
+}
+
+static void ivshmem_add_kvm_msi_virq(IVShmemState *s, int vector, Error **errp)
+{
+    PCIDevice *pdev = PCI_DEVICE(s);
+
+    IVSHMEM_DPRINTF("ivshmem_add_kvm_msi_virq vector:%d\n", vector);
+    assert(!s->msi_vectors[vector].pdev);
+
+    s->msi_vectors[vector].unmasked = false;
+    s->msi_vectors[vector].pdev = pdev;
+}
+
+static void ivshmem_remove_kvm_msi_virq(IVShmemState *s, int vector)
+{
+    IVSHMEM_DPRINTF("ivshmem_remove_kvm_msi_virq vector:%d\n", vector);
+
+    if (s->msi_vectors[vector].pdev == NULL) {
+        return;
+    }
+
+    if (s->msi_vectors[vector].unmasked) {
+        ivshmem_irqfd_vector_mask(s->msi_vectors[vector].pdev, vector);
+    }
+
+    s->msi_vectors[vector].pdev = NULL;
+}
+
+static void process_msg_disconnect(IVShmemState *s, IvshmemPeerGone *msg,
+                                   Error **errp)
+{
+    if (msg->header.len < sizeof(*msg)) {
+        error_setg(errp, "Invalid peer-gone message size");
+        return;
+    }
+
+    le32_to_cpus(&msg->id);
+
+    IVSHMEM_DPRINTF("peer %d has gone away\n", msg->id);
+    if (msg->id >= s->nb_peers || msg->id == s->vm_id) {
+        error_setg(errp, "invalid peer %d", msg->id);
+        return;
+    }
+    close_peer_eventfds(s, msg->id);
+    event_notifier_set(&s->peers[s->vm_id].eventfds[0]);
+}
+
+static void process_msg_connect(IVShmemState *s, IvshmemEventFd *msg, int fd,
+                                Error **errp)
+{
+    Peer *peer;
+
+    if (msg->header.len < sizeof(*msg)) {
+        error_setg(errp, "Invalid eventfd message size");
+        close(fd);
+        return;
+    }
+
+    le32_to_cpus(&msg->id);
+    le32_to_cpus(&msg->vector);
+
+    if (msg->id >= s->nb_peers) {
+        resize_peers(s, msg->id + 1);
+    }
+
+    peer = &s->peers[msg->id];
+
+    /*
+     * The N-th connect message for this peer comes with the file
+     * descriptor for vector N-1.
+     */
+    if (msg->vector != peer->nb_eventfds) {
+        error_setg(errp, "Received vector %d out of order", msg->vector);
+        close(fd);
+        return;
+    }
+    if (peer->nb_eventfds >= s->vectors) {
+        error_setg(errp, "Too many eventfd received, device has %d vectors",
+                   s->vectors);
+        close(fd);
+        return;
+    }
+    peer->nb_eventfds++;
+
+    if (msg->vector == 0)
+        peer->eventfds = g_new0(EventNotifier, s->vectors);
+
+    IVSHMEM_DPRINTF("eventfds[%d][%d] = %d\n", msg->id, msg->vector, fd);
+    event_notifier_init_fd(&peer->eventfds[msg->vector], fd);
+    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
+
+    if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD)) {
+        ivshmem_add_eventfd(s, msg->id, msg->vector);
+    }
+
+    if (msg->id == s->vm_id) {
+        ivshmem_watch_vector_notifier(s, peer->nb_eventfds - 1);
+    }
+}
+
+static int ivshmem_can_receive(void *opaque)
+{
+    IVShmemState *s = opaque;
+
+    assert(s->msg_buffered_bytes < sizeof(s->msg_buf));
+    return sizeof(s->msg_buf) - s->msg_buffered_bytes;
+}
+
+static void ivshmem_read(void *opaque, const uint8_t *buf, int size)
+{
+    IVShmemState *s = opaque;
+    IvshmemMsgHeader *header = (IvshmemMsgHeader *)&s->msg_buf;
+    Error *err = NULL;
+    int fd;
+
+    assert(size >= 0 && s->msg_buffered_bytes + size <= sizeof(s->msg_buf));
+    memcpy(s->msg_buf + s->msg_buffered_bytes, buf, size);
+    s->msg_buffered_bytes += size;
+    if (s->msg_buffered_bytes < sizeof(*header) ||
+        s->msg_buffered_bytes < le32_to_cpu(header->len)) {
+        return;
+    }
+
+    fd = qemu_chr_fe_get_msgfd(&s->server_chr);
+
+    le32_to_cpus(&header->type);
+    le32_to_cpus(&header->len);
+
+    switch (header->type) {
+    case IVSHMEM_MSG_EVENT_FD:
+        process_msg_connect(s, (IvshmemEventFd *)header, fd, &err);
+        break;
+    case IVSHMEM_MSG_PEER_GONE:
+        process_msg_disconnect(s, (IvshmemPeerGone *)header, &err);
+        break;
+    default:
+        error_setg(&err, "invalid message, type %d", header->type);
+        break;
+    }
+    if (err) {
+        error_report_err(err);
+    }
+
+    s->msg_buffered_bytes -= header->len;
+    memmove(s->msg_buf, s->msg_buf + header->len, s->msg_buffered_bytes);
+}
+
+static void ivshmem_recv_setup(IVShmemState *s, Error **errp)
+{
+    IvshmemInitialInfo msg;
+    struct stat buf;
+    uint8_t dummy;
+    int fd, n, ret;
+
+    n = 0;
+    do {
+        ret = qemu_chr_fe_read_all(&s->server_chr, (uint8_t *)&msg + n,
+                                   sizeof(msg) - n);
+        if (ret < 0) {
+            if (ret == -EINTR) {
+                continue;
+            }
+            error_setg_errno(errp, -ret, "read from server failed");
+            return;
+        }
+        n += ret;
+    } while (n < sizeof(msg));
+
+    fd = qemu_chr_fe_get_msgfd(&s->server_chr);
+
+    le32_to_cpus(&msg.header.type);
+    le32_to_cpus(&msg.header.len);
+    if (msg.header.type != IVSHMEM_MSG_INIT || msg.header.len < sizeof(msg)) {
+        error_setg(errp, "server sent invalid initial info");
+        return;
+    }
+
+    /* consume additional bytes of message */
+    msg.header.len -= sizeof(msg);
+    while (msg.header.len > 0) {
+        ret = qemu_chr_fe_read_all(&s->server_chr, &dummy, 1);
+        if (ret < 0) {
+            if (ret == -EINTR) {
+                continue;
+            }
+            error_setg_errno(errp, -ret, "read from server failed");
+            return;
+        }
+        msg.header.len -= ret;
+    }
+
+    le32_to_cpus(&msg.compatible_version);
+    if (msg.compatible_version != IVSHMEM_PROTOCOL_VERSION) {
+        error_setg(errp, "server sent compatible version %u, expecting %u",
+                   msg.compatible_version, IVSHMEM_PROTOCOL_VERSION);
+        return;
+    }
+
+    le32_to_cpus(&msg.id);
+    if (msg.id > IVSHMEM_MAX_PEERS) {
+        error_setg(errp, "server sent invalid ID");
+        return;
+    }
+    s->vm_id = msg.id;
+
+    if (fstat(fd, &buf) < 0) {
+        error_setg_errno(errp, errno,
+            "can't determine size of shared memory sent by server");
+        close(fd);
+        return;
+    }
+
+    s->shmem_sz = buf.st_size;
+
+    s->shmem = mmap(NULL, s->shmem_sz, PROT_READ | PROT_WRITE, MAP_SHARED,
+                    fd, 0);
+    if (s->shmem == MAP_FAILED) {
+        error_setg_errno(errp, errno,
+                         "can't map shared memory sent by server");
+        return;
+    }
+
+    le32_to_cpus(&msg.vectors);
+    if (msg.vectors < 1 || msg.vectors > 1024) {
+        error_setg(errp, "server sent invalid number of vectors message");
+        return;
+    }
+    s->vectors = msg.vectors;
+
+    s->max_peers = le32_to_cpu(msg.max_peers);
+    s->protocol = le32_to_cpu(msg.protocol);
+    s->output_section_sz = le64_to_cpu(msg.output_section_size);
+}
+
+/* Select the MSI-X vectors used by device.
+ * ivshmem maps events to vectors statically, so
+ * we just enable all vectors on init and after reset. */
+static void ivshmem_msix_vector_use(IVShmemState *s)
+{
+    PCIDevice *d = PCI_DEVICE(s);
+    int i;
+
+    for (i = 0; i < s->vectors; i++) {
+        msix_vector_use(d, i);
+    }
+}
+
+static void ivshmem_reset(DeviceState *d)
+{
+    IVShmemState *s = IVSHMEM(d);
+
+    ivshmem_disable_irqfd(s);
+
+    s->intctrl = 0;
+    ivshmem_write_state(s, 0);
+    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
+        ivshmem_msix_vector_use(s);
+    }
+}
+
+static int ivshmem_setup_interrupts(IVShmemState *s, Error **errp)
+{
+    /* allocate QEMU callback data for receiving interrupts */
+    s->msi_vectors = g_malloc0(s->vectors * sizeof(MSIVector));
+
+    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
+        if (msix_init_exclusive_bar(PCI_DEVICE(s), s->vectors, 1, errp)) {
+            IVSHMEM_DPRINTF("msix requested but not available - disabling\n");
+            s->features &= ~(IVSHMEM_MSI | IVSHMEM_IOEVENTFD);
+        } else {
+            IVSHMEM_DPRINTF("msix initialized (%d vectors)\n", s->vectors);
+            ivshmem_msix_vector_use(s);
+        }
+    }
+
+    return 0;
+}
+
+static void ivshmem_enable_irqfd(IVShmemState *s)
+{
+    PCIDevice *pdev = PCI_DEVICE(s);
+    int i;
+
+    for (i = 0; i < s->peers[s->vm_id].nb_eventfds; i++) {
+        Error *err = NULL;
+
+        ivshmem_unwatch_vector_notifier(s, i);
+
+        ivshmem_add_kvm_msi_virq(s, i, &err);
+        if (err) {
+            error_report_err(err);
+            goto undo;
+        }
+    }
+
+    if (msix_set_vector_notifiers(pdev,
+                                  ivshmem_irqfd_vector_unmask,
+                                  ivshmem_irqfd_vector_mask,
+                                  ivshmem_irqfd_vector_poll)) {
+        error_report("ivshmem: msix_set_vector_notifiers failed");
+        goto undo;
+    }
+    return;
+
+undo:
+    while (--i >= 0) {
+        ivshmem_remove_kvm_msi_virq(s, i);
+    }
+}
+
+static void ivshmem_disable_irqfd(IVShmemState *s)
+{
+    PCIDevice *pdev = PCI_DEVICE(s);
+    int i;
+
+    if (!pdev->msix_vector_use_notifier) {
+        return;
+    }
+
+    msix_unset_vector_notifiers(pdev);
+
+    for (i = 0; i < s->peers[s->vm_id].nb_eventfds; i++) {
+        ivshmem_remove_kvm_msi_virq(s, i);
+        ivshmem_watch_vector_notifier(s, i);
+    }
+
+}
+
+static void ivshmem_write_config(PCIDevice *pdev, uint32_t address,
+                                 uint32_t val, int len)
+{
+    IVShmemState *s = IVSHMEM(pdev);
+    bool was_usable = ivshmem_irqfd_usable(s);
+
+    pci_default_write_config(pdev, address, val, len);
+    ivshmem_update_irqfd(s, was_usable);
+}
+
+static void ivshmem_exit(PCIDevice *dev)
+{
+    IVShmemState *s = IVSHMEM(dev);
+    int i;
+
+    if (s->migration_blocker) {
+        migrate_del_blocker(s->migration_blocker);
+        error_free(s->migration_blocker);
+    }
+
+    if (memory_region_is_mapped(&s->rw_section)) {
+        void *addr = memory_region_get_ram_ptr(&s->rw_section);
+        int fd;
+
+        if (munmap(addr, memory_region_size(&s->rw_section) == -1)) {
+            error_report("Failed to munmap shared memory %s",
+                         strerror(errno));
+        }
+
+        fd = memory_region_get_fd(&s->rw_section);
+        close(fd);
+
+        vmstate_unregister_ram(&s->state_tab, DEVICE(dev));
+        vmstate_unregister_ram(&s->rw_section, DEVICE(dev));
+    }
+
+    if (s->peers) {
+        for (i = 0; i < s->nb_peers; i++) {
+            close_peer_eventfds(s, i);
+        }
+        g_free(s->peers);
+    }
+
+    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
+        msix_uninit_exclusive_bar(dev);
+    }
+
+    g_free(s->msi_vectors);
+}
+
+static int ivshmem_pre_load(void *opaque)
+{
+    IVShmemState *s = opaque;
+
+    if (!ivshmem_is_master(s)) {
+        error_report("'peer' devices are not migratable");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int ivshmem_post_load(void *opaque, int version_id)
+{
+    IVShmemState *s = opaque;
+
+    if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
+        ivshmem_msix_vector_use(s);
+    }
+    return 0;
+}
+
+static const VMStateDescription ivshmem_vmsd = {
+    .name = TYPE_IVSHMEM,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .pre_load = ivshmem_pre_load,
+    .post_load = ivshmem_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, IVShmemState),
+        VMSTATE_MSIX(parent_obj, IVShmemState),
+        VMSTATE_UINT32(state, IVShmemState),
+        VMSTATE_UINT32(intctrl, IVShmemState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static Property ivshmem_properties[] = {
+    DEFINE_PROP_CHR("chardev", IVShmemState, server_chr),
+    DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD,
+                    true),
+    DEFINE_PROP_ON_OFF_AUTO("master", IVShmemState, master, ON_OFF_AUTO_OFF),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ivshmem_init(Object *obj)
+{
+    IVShmemState *s = IVSHMEM(obj);
+
+    s->features |= (1 << IVSHMEM_MSI);
+}
+
+static void ivshmem_realize(PCIDevice *dev, Error **errp)
+{
+    IVShmemState *s = IVSHMEM(dev);
+    Chardev *chr = qemu_chr_fe_get_driver(&s->server_chr);
+    size_t rw_section_sz, input_sections_sz;
+    IVShmemVndrCap *vndr_cap;
+    Error *err = NULL;
+    uint8_t *pci_conf;
+    int offset, priv_ctrl_pos;
+    off_t shmem_pos;
+
+    if (!qemu_chr_fe_backend_connected(&s->server_chr)) {
+        error_setg(errp, "You must specify a 'chardev'");
+        return;
+    }
+
+    /* IRQFD requires MSI */
+    if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD) &&
+        !ivshmem_has_feature(s, IVSHMEM_MSI)) {
+        error_setg(errp, "ioeventfd/irqfd requires MSI");
+        return;
+    }
+
+    pci_conf = dev->config;
+    pci_conf[PCI_COMMAND] = PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
+
+    memory_region_init_io(&s->ivshmem_mmio, OBJECT(s), &ivshmem_mmio_ops, s,
+                          "ivshmem.mmio", IVSHMEM_REG_BAR_SIZE);
+
+    /* region for registers*/
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                     &s->ivshmem_mmio);
+
+    assert(chr);
+    IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
+                    chr->filename);
+
+    /*
+     * Receive setup messages from server synchronously.
+     * Older versions did it asynchronously, but that creates a
+     * number of entertaining race conditions.
+     */
+    ivshmem_recv_setup(s, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    /* we allocate enough space for 16 peers and grow as needed */
+    resize_peers(s, 16);
+
+    if (s->master == ON_OFF_AUTO_ON && s->vm_id != 0) {
+        error_setg(errp,
+                   "Master must connect to the server before any peers");
+        return;
+    }
+
+    qemu_chr_fe_set_handlers(&s->server_chr, ivshmem_can_receive,
+                             ivshmem_read, NULL, NULL, s, NULL, true);
+
+    if (ivshmem_setup_interrupts(s, errp) < 0) {
+        error_prepend(errp, "Failed to initialize interrupts: ");
+        return;
+    }
+
+    memory_region_init(&s->ivshmem_bar2, OBJECT(s), "ivshmem.bar2",
+                       s->shmem_sz);
+
+    input_sections_sz = s->output_section_sz * s->max_peers;
+    if (input_sections_sz + 4096 > s->shmem_sz) {
+        error_setg(errp,
+                   "Invalid output section size, shared memory too small");
+        return;
+    }
+    rw_section_sz = s->shmem_sz - input_sections_sz - 4096;
+
+    shmem_pos = 0;
+    memory_region_init_ram_ptr(&s->state_tab, OBJECT(s), "ivshmem.state",
+                               4096, s->shmem + shmem_pos);
+    memory_region_set_readonly(&s->state_tab, true);
+    memory_region_add_subregion(&s->ivshmem_bar2, shmem_pos, &s->state_tab);
+
+    vmstate_register_ram(&s->state_tab, DEVICE(s));
+
+    if (rw_section_sz > 0) {
+        shmem_pos += 4096;
+        memory_region_init_ram_ptr(&s->rw_section, OBJECT(s),
+                                   "ivshmem.rw-section",
+                                   rw_section_sz, s->shmem + shmem_pos);
+        memory_region_add_subregion(&s->ivshmem_bar2, shmem_pos,
+                                    &s->rw_section);
+
+        vmstate_register_ram(&s->rw_section, DEVICE(s));
+    }
+
+    if (s->output_section_sz > 0) {
+        shmem_pos += rw_section_sz;
+        memory_region_init_ram_ptr(&s->input_sections, OBJECT(s),
+                                   "ivshmem.input-sections", input_sections_sz,
+                                   s->shmem + shmem_pos);
+        memory_region_set_readonly(&s->input_sections, true);
+        memory_region_add_subregion(&s->ivshmem_bar2, shmem_pos,
+                                    &s->input_sections);
+
+        shmem_pos += s->vm_id * s->output_section_sz;
+        memory_region_init_ram_ptr(&s->output_section, OBJECT(s),
+                                   "ivshmem.output-section",
+                                   s->output_section_sz, s->shmem + shmem_pos);
+        memory_region_add_subregion_overlap(&s->ivshmem_bar2, shmem_pos,
+                                            &s->output_section, 1);
+
+        vmstate_register_ram(&s->input_sections, DEVICE(s));
+    }
+
+    pci_config_set_class(dev->config, 0xff00 | (s->protocol >> 8));
+    pci_config_set_prog_interface(dev->config, (uint8_t)s->protocol);
+
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, 0x18,
+                                &error_abort);
+    vndr_cap = (IVShmemVndrCap *)(pci_conf + offset);
+    vndr_cap->length = 0x18;
+    vndr_cap->state_tab_sz = cpu_to_le32(4096);
+    vndr_cap->rw_section_sz = cpu_to_le64(rw_section_sz);
+    vndr_cap->output_section_sz = s->output_section_sz;
+
+    priv_ctrl_pos = offset + offsetof(IVShmemVndrCap, priv_ctrl);
+    s->priv_ctrl = &dev->config[priv_ctrl_pos];
+    dev->wmask[priv_ctrl_pos] |= IVSHMEM_ONESHOT_MODE;
+
+    if (s->master == ON_OFF_AUTO_AUTO) {
+        s->master = s->vm_id == 0 ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
+    }
+
+    if (!ivshmem_is_master(s)) {
+        error_setg(&s->migration_blocker,
+                   "Migration is disabled when using feature 'peer mode' in device 'ivshmem'");
+        migrate_add_blocker(s->migration_blocker, &err);
+        if (err) {
+            error_propagate(errp, err);
+            error_free(s->migration_blocker);
+            return;
+        }
+    }
+
+    pci_register_bar(PCI_DEVICE(s), 2,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_PREFETCH |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     &s->ivshmem_bar2);
+}
+
+static void ivshmem_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = ivshmem_realize;
+    k->exit = ivshmem_exit;
+    k->config_write = ivshmem_write_config;
+    k->vendor_id = PCI_VENDOR_ID_IVSHMEM;
+    k->device_id = PCI_DEVICE_ID_IVSHMEM;
+    dc->reset = ivshmem_reset;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "Inter-VM shared memory v2";
+
+    dc->props = ivshmem_properties;
+    dc->vmsd = &ivshmem_vmsd;
+}
+
+static const TypeInfo ivshmem_info = {
+    .name          = TYPE_IVSHMEM,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(IVShmemState),
+    .instance_init = ivshmem_init,
+    .class_init    = ivshmem_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void ivshmem_register_types(void)
+{
+    type_register_static(&ivshmem_info);
+}
+
+type_init(ivshmem_register_types)
diff --git a/include/hw/misc/ivshmem2.h b/include/hw/misc/ivshmem2.h
new file mode 100644
index 0000000000..ee994699e8
--- /dev/null
+++ b/include/hw/misc/ivshmem2.h
@@ -0,0 +1,48 @@
+/*
+ * Inter-VM Shared Memory PCI device, Version 2.
+ *
+ * Copyright (c) Siemens AG, 2019
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+#ifndef IVSHMEM2_H
+#define IVSHMEM2_H
+
+#define IVSHMEM_PROTOCOL_VERSION    2
+
+#define IVSHMEM_MSG_INIT            0
+#define IVSHMEM_MSG_EVENT_FD        1
+#define IVSHMEM_MSG_PEER_GONE       2
+
+typedef struct IvshmemMsgHeader {
+    uint32_t type;
+    uint32_t len;
+} IvshmemMsgHeader;
+
+typedef struct IvshmemInitialInfo {
+    IvshmemMsgHeader header;
+    uint32_t version;
+    uint32_t compatible_version;
+    uint32_t id;
+    uint32_t max_peers;
+    uint32_t vectors;
+    uint32_t protocol;
+    uint64_t output_section_size;
+} IvshmemInitialInfo;
+
+typedef struct IvshmemEventFd {
+    IvshmemMsgHeader header;
+    uint32_t id;
+    uint32_t vector;
+} IvshmemEventFd;
+
+typedef struct IvshmemPeerGone {
+    IvshmemMsgHeader header;
+    uint32_t id;
+} IvshmemPeerGone;
+
+#endif /* IVSHMEM2_H */
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11f8ab7149..f0c5d5ed2b 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -264,6 +264,8 @@
 #define PCI_VENDOR_ID_NEC                0x1033
 #define PCI_DEVICE_ID_NEC_UPD720200      0x0194
 
+#define PCI_VENDOR_ID_SIEMENS            0x110a
+
 #define PCI_VENDOR_ID_TEWS               0x1498
 #define PCI_DEVICE_ID_TEWS_TPCI200       0x30C8
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5542adccc5bda38da2cd0f46398850dc4ec31f2a.1578407802.git.jan.kiszka%40siemens.com.
