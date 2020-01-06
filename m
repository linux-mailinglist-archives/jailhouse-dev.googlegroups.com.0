Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5WLZTYAKGQEFBAVYOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2B131209
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:07 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id r2sf24845060wrp.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313206; cv=pass;
        d=google.com; s=arc-20160816;
        b=dOOHP+MJtag0a+4mgLIIJvrNYZpdSsJq7DeCMXsQA2UssBO8+dTazyVZlnq+gAWzoL
         zpmA/GgJsutr9IDKTfqsXGkWJUk6qnoVAwY3WOgd0Y4bBc992C4Xcg7kMDeodCKCrmpF
         HkRKZvl4pnyrW6vpBn/RqN8W7/gtIXenIY6wCfhrgBKzp0mYEPhu5b1v8pvxS1ysXS6Y
         hWCZDVDXdyqAT57kNJm3H/0AiW8X3S9ec/DUPzUxR1O4gw/3/MrOdVo6lnAkjkajwuAL
         pmTT7DQyV8IlRVoWROjC6BsyHRbpEeGjC3ECD7y1i7M8xwoKeBbovhnCGGXgSrN4BdcF
         POoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=lZYgyJMwe12iuirGSVtqZ888Oj7wwL0N5BlK7v0SjVk=;
        b=PKV1UOMQ27m4x6RnnkPfKEJXWvDK9hQ3OQxpHG5rtup1d4cP65iVNODasQLjA7nvjw
         T5lD3qjJX5gcPhlA0MMUjkBcKbEjYIwpggi0ZyeOAmdA4NLphocLkcNG+gH2hzr+A5qm
         tkrM+PkHVHkjdYZWCKbdgv2IMxsjWMxJRl91Kfl1KFHVf+GCL73m/212nWVwCd4GH22Z
         AdV2DaAtTNlbhQuOLeL8gyVWL4M9/m8QbcPFeF/KC6+tg+mbe3CeG1r2/ONQ5pD+cyYp
         hT0zV+mT9kKZkI2QtiZRSp0Q5gWy3BbzTwJSgZuMw/qOOo9eLiqgnseq9aDDUtEXdiDr
         KQGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lZYgyJMwe12iuirGSVtqZ888Oj7wwL0N5BlK7v0SjVk=;
        b=DCoinqJtUlM8Pb9LUZKTvNQ7oPCVERmUBFrBSLJ9qAzzu0FH0N3BVCEpmjdYdFdRzI
         erKWwYYad19UpsNDfhpOrjfyr6drnkq+A+WyGzfg/54hyfu3LkukB19FAAAmbFdWeb8b
         t3SrHPq1hJJSCa7+GI22liuJX2Ksu3FbOe/XxoqGdyAxQaXabLW5LwnKg9ESo97wXObG
         dSbIH2ksC6FQpuPmbkA0BV0mr+o/CSfiivvYFoincTeFkWzLBKFDq7Xc/Qwn6X5WrzUR
         ZzP7V8m7R1DW0mrHlpGOd2F4LX8awkcHi8J2IXeg30kMQXvfLSpl3fnwRQwst4xZJiK4
         P5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lZYgyJMwe12iuirGSVtqZ888Oj7wwL0N5BlK7v0SjVk=;
        b=E50aPRMgwnGRehzVmV+q//OJfEPH8cyBibP6m8QWksYf5FClfxO2SdZM/jzcuKFQvy
         BmruyG2uZJ8Y+RkdsBgnqv9jntPFrpp+qxAxSu37XwNWluGo5LVQisoQF73wMIjFDpMP
         WKWM4DqzWF04rjeeZDxxlzWnu+FOvuFUSOfwdd5nj/BybiSZzbuJOMpz3zOsGRHkpsvl
         nPe/INjwZpRo6FO1OIDthkquoNsBqVNBXKpPDQqoMsneqvZnfbOCLvF1W8moqWoR/UMX
         fSX1VqFV7Yk63eth/BFmQZDvVUb/AdGd2l8e91BK3sjs35lQ71JHpIjsjt94gMRmbl1r
         DbKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWiHwjlWaXgqK/dTyq2rs/yrB98QYMpTbwEl0owJ8C1ZM5H1i4Y
	98vecaFUkQZfXYRpB+o31e4=
X-Google-Smtp-Source: APXvYqyFehZyetGttfv0fn8+lgfiU9Qs0K/ZoMSjAWKAWNqcqA2bDfUkyfSaHfb77M5fWXuUFBlIrw==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr32938703wmg.74.1578313206757;
        Mon, 06 Jan 2020 04:20:06 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4682:: with SMTP id u2ls12878888wrq.14.gmail; Mon, 06
 Jan 2020 04:20:06 -0800 (PST)
X-Received: by 2002:adf:82a7:: with SMTP id 36mr108232649wrc.203.1578313206001;
        Mon, 06 Jan 2020 04:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313205; cv=none;
        d=google.com; s=arc-20160816;
        b=Wp2RZZObe99WOGF4/ZUVKXm57Mkqz0YCX2nT9sl2U5ykQbUI95apvQDkoE5ItC2j+P
         sziwogjEGqhN9YZsu6lWLqi0NOWblr0qgH6x0Bz6lmD25or/UFLVqMBXO+ZLWrBlU9hX
         8kpDnFLeFfKHOPhnbjwUkn6acKmxbxEzDD64OWBWI+qkKoUF4w7qV4ZeBB53rhIG0IDU
         bF2baVXZ4qJiTdIRAc4eoq54PEkwPlKora7pF+mlGxUACiy4bM32833E0mMlFB0oEMDp
         OjcGaq1+fLx0pEIdoMcMbVqq4XWuko74hCx2NxFrP/mhtjiCMhw57ZFD6ZhY1sTzcxb5
         y6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=CxWxxmva+dN2nCvInd/+//YPC57MHrxcq8MMau4QgoI=;
        b=e9T406TCwvPsSCGevh0FxKbe/bJDBYA+OJgGMgCXxqhmdz2VCXRnB1D1oHisVRWofm
         luH7ITTpBqBQc8BMPnwaH35FXxWa4ldHAJ29gqtx4HcRm5sPzyaX36llD2dqhv9DJmzr
         E43bRSqNa4X9tZz+tu2uwYoGAW3jDE4qmv8bVGP636D899gmReKvS7gml91cpNbzsBGZ
         sEEXdoZaaDgdnnw6AgjkHrVG8zNpKIPDEPFkWWkVot4rQNcLOWOqAhOGApWqC9qK/3FW
         0PtwRtQKQZy4E2MItxA5xoaOZD+bEGYFc+bnbKL30OcatDYCFyr5mcDxC57a/0CQ6EIx
         S/Dg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m2si943975wmi.3.2020.01.06.04.20.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK535019474
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:05 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKFC029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 38/38] Documentation: Update inter-cell-communication
Date: Mon,  6 Jan 2020 13:18:19 +0100
Message-Id: <8c898c1b3c88f425a1c114a8fcf76d62f3971fd2.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

This is a rewrite, pointing to the spec document for details on the
device, describing the new configuration format. The demo section is
left blank until the related ivshmem-demos are updated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/inter-cell-communication.md  | 79 ++++++++++++++++++++++++++++++
 Documentation/inter-cell-communication.txt | 76 ----------------------------
 2 files changed, 79 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/inter-cell-communication.md
 delete mode 100644 Documentation/inter-cell-communication.txt

diff --git a/Documentation/inter-cell-communication.md b/Documentation/inter-cell-communication.md
new file mode 100644
index 00000000..02136de2
--- /dev/null
+++ b/Documentation/inter-cell-communication.md
@@ -0,0 +1,79 @@
+Inter-Cell communication of the Jailhouse Hypervisor
+====================================================
+
+The hypervisor isolates cells but sometimes there is a need to exchange data
+between cells. For that purpose Jailhouse provides shared memory and signaling
+between cells via virtual ivshmem PCI devices. This device type is specified
+in [1].
+
+
+Adding Inter-cell communication
+-------------------------------
+
+In order to set up a communication channel between two or more cells you first
+have to add memory regions to both cells. Each cell needs the follow regions:
+
+ - read-only region to hold state table, generally one page large
+ - one region that is read/writable for all peers
+ - one output region per peer that is only read-writeable for one of them
+
+With 2 peers connected, this means a consecutive series of 4 regions needs to
+be created. When connecting 3 peers, 5 regions are needed, and so on. All
+regions must also be consecutive in guest-physical memory because only the
+address for the first region is communicated to the guest.
+
+The second, common read-write region is optional and can be zero-sized. Also
+the output regions are optional. All output regions must have the same size.
+Write permission to the first output region must only be granted to the cell
+that has the ivshmem device ID 0, write permission to the second region must be
+granted to ID 1, and so forth.
+
+Non-root cells sharing memory with the root cell need the memory flag
+`JAILHOUSE_MEM_ROOTSHARED` on the region.
+
+To define the memory regions of an ivshmem-net device, the macro
+`JAILHOUSE_SHMEM_NET_REGIONS(base_address, id)` is provided. It uses 1 MB of
+memory at the specified base address and assigns access according to the
+specified ID. Shared memory based network devices only connect 2 peers, thus
+4 memory regions will be added.
+
+After creating the memory regions, also a PCI device needs to be added to each
+connected cell. Set the device type to `JAILHOUSE_PCI_TYPE_IVSHMEM`. The `bdf`
+field must specify an unused bus-device-function slot on a physical or virtual
+PCI controller. All connected peers must use the same `bdf` value in order to
+establish the link. They may use different `domain` values, though.
+
+Set the bar_mask to either `JAILHOUSE_IVSHMEM_BAR_MASK_MSIX` or
+`JAILHOUSE_IVSHMEM_BAR_MASK_INTX`, depending on whether MSI-X is available or
+not. When MSI-X is used, num_msix_vectors must be set according to the needs of
+the shared memory protocol used on the link. For ivshmem networking, grant 2
+vectors.
+
+Further fields needed:
+ - `shmem_regions_start` - index of first shared memory region used by device
+ - `shmem_dev_id` - ID of the peer (0..`shmem_peers`-1)
+ - `shmem_peers` - maximum number of connected peers
+ - `shmem_protocol` - shared memory protocol used over the link
+
+Set `shmem_protocol` to JAILHOUSE_SHMEM_PROTO_VETH for ivshmem networking, use
+`JAILHOUSE_SHMEM_PROTO_UNDEFINED` for custom protocols, or pick an ID from the
+custom range defined in [1].
+
+You may also need to set the `iommu` field to match the IOMMU unit that the
+guest expects based on the `bdf` value. Try 1 if MSI-X interrupts do not make
+it when using 0.
+
+For an example have a look at the cell configuration files `qemu-x86.c`,
+`ivshmem-demo.c`, and `linux-x86-demo.c` in `configs/x86`.
+
+
+Demo code
+---------
+
+TODO
+
+
+References
+----------
+
+[1] Documentation/ivshmem-v2-specification.md
diff --git a/Documentation/inter-cell-communication.txt b/Documentation/inter-cell-communication.txt
deleted file mode 100644
index 475ca500..00000000
--- a/Documentation/inter-cell-communication.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-Inter-Cell communication of the Jailhouse Hypervisor
-====================================================
-
-The hypervisor isolates cells but sometimes there is a need to exchange data
-between cells. For that purpose Jailhouse provides shared memory and signaling
-between cells.
-
-One channel is always between exactly two cells, there is no 1:n or n:m
-communication.
-
-The interface used between the cell and the hypervisor
-------------------------------------------------------
-
-One end of such a communication channel is modeled as a PCI device that a cell
-can discover on it's PCI bus. The device model used closely follows the
-"ivshmem" device known from Qemu (see qemu docs/specs/ivshmem_device_spec.txt
-and https://gitorious.org/nahanni/).
-The device implemented by jailhouse supports MSI-X for signaling. While the
-spec would allow for multiple interrupts, Jailhouse supports exactly one per
-virtual device.
-
-The ivshmem device implemented by the jailhouse hypervisor is different to the
-mentioned specification in several regards. One is that the location and the
-size of the shared memory region itself are not encoded in a PCI BAR. Device
-drivers get the relevant information by accessing custom PCI config space
-registers. See hypervisor/pci_ivshmem.c IVSHMEM_CFG_SHMEM_* or the ivshmem demo
-in the inmates directory.
-
-To facilitate state synchronisation between cells, two additional MMIO
-registers are provided:
-
-    Offset  Size    Access      Reset   Function
-    16      4       read/write  0       Local state (LSTATE)
-    20      4       read-only   0       Remote state (RSTATE)
-
-Local state: Current value is visible as RSTATE in the connected cell.
-Writes trigger the doorbell as by writing to the Doorbell register.
-
-Remote state: Returns the current value of the LSTATE register in the
-connected cell, zero if no peer is connected.
-
-Moreover, the PCI Class Code field of the Jailhouse ivshmem device differs from
-the one used by the original device. The base class code (top byte) is 0xff.
-The subclass code (middle byte) is tunable via the cell configuration to encode
-the protocol that the connected cells are expected to implement over the shared
-memory. The programming interface code (low byte) is tunable as well and is
-supposed to encode possible revisions of that protocol.
-
-Adding Inter-cell communication to cells
-----------------------------------------
-
-In order to set up a communication channel between two cells you first have to
-add a memory region to both cells. Add a read/write region with matching size
-and physical address to both cells. Non-root cells sharing memory with the
-root cell need the memory flag "JAILHOUSE_MEM_ROOTSHARED" on the region.
-To allow cells to discover shared memory and send each other MSIs you also
-need to add a virtual PCI device to both cells. The "type" should be set to
-"JAILHOUSE_PCI_TYPE_IVSHMEM" and "shmem_region" should be set to the index
-of the memory region. "num_msix_vectors" should be set to 1 and for your root
-cell config you should make sure that "iommu" is set to the correct value,
- try using the same value that works for the other pci devices.
-The link between two such virtual PCI devices is established by using the same
-"bdf". The size and location of the shared memory can be configured freely but
-you have to make sure that the values match on both sides. The "shmem_protocol"
-has to match as well.
-For an example have a look at the cell configuration files of qemu and the
-ivshmem-demo.
-
-Demo code
----------
-
-You can go ahead and connect two non-root cells and run the ivshmem-demo. They
-will send each other interrupts.
-For the root cell you can find some test code in the following git repository:
-https://github.com/henning-schild-work/ivshmem-guest-code
-Check out the jailhouse branch and have a look at README.jailhouse.
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8c898c1b3c88f425a1c114a8fcf76d62f3971fd2.1578313099.git.jan.kiszka%40siemens.com.
