Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ4DUPTAKGQEA2LG3RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E00101FD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 23:45:12 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id x16sf4435090edm.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 14:45:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556660712; cv=pass;
        d=google.com; s=arc-20160816;
        b=cnWrFQf7eKhGSX/UOUqbMHmcHwulXATLfYRxZVa6/PQnYwJS1iDuPSw8wQ5pgvGzVd
         hCT6uqtPdk0wQ91o+/cRL61Dw5yLrPWhkjdVp9BBxm6WV69M8SECE3V2LSihPM5xtrju
         1Rs6K8giYCZANfr2mDs3qnEYyois/Es7zGd119oGKx14JckO9VTrx3BrQTCk9QTdT3mq
         NhdR21QjkcNWYbAi7UdUf0nNs6kMyQjGve+HnKtke0hKL1KeToIBzmQbf4aZ9dihHta4
         dAoMCjwMrPFYLIWd9hNNCVV19aAD4zkt7azOMU+tz/vFH5ZgZ7+v7V7EvNsbW484JIsx
         Wp3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=mGaScKPbrIMlHRJ+hozwMqZA76oUncy19LVYwgsVQYk=;
        b=KaybYRtYX1S8sRFdoZUp6YX1z3XabiabuUuMiVYaMdzfXuAxDt6/SHdVdBkKAu1Ow+
         sJaMxhPAmdORifVfntRGmC7Ptbs1J46M3FUJT90KODb9Hu9Xzc5EpH6Sv7/qM/uoSKg+
         3Y1GGva140djINBc34IVo5qtb94Zq7ZlWSHQ4UXg6MvZYvYZNnPJu4p0rRjpcGkjkJRo
         EhbuFIJ93Id7jymodGoi6UdW2sOkhpL2ZME2Quj4Vyk1sHguiL/TABxgB8OqOatHSpKA
         U07S15Is2MhN5emldddREE1J8LYgRYciIlDTb9/NijJcgLB0MtupR7fxqbMyEulc7eP7
         74dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mGaScKPbrIMlHRJ+hozwMqZA76oUncy19LVYwgsVQYk=;
        b=NUuN38DnXOPcSHt8J7OufI7LnZHtV2Y7EUMsTOBihlCAryBAEXWDvmqO3LBZwmAnyW
         lY/wzFRv7SqW0CFmR1uPt+CsGCJQpHZ/CxiDIiMnphXAX08Rc0rEenuDIKIS8DUAkH+1
         7IutKhtzYzHGIyAyiBcoP3kT+q+HV2gYMrkx7j2IJy8GBzODjix/07KwqNyH4EsNaRpK
         4aLJ3f7iljA7Jx7WAgEFbDOKEyawzScz5IRvKDtRzCrMG7XgRgcDuF5eR+j2yd/8SikO
         31TW3lg3fQ1CrH7NAoEjIVYFM4imxKSU07viBTHoTkvzH6sltF/g0MmNdSOaCPzy01z/
         2+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mGaScKPbrIMlHRJ+hozwMqZA76oUncy19LVYwgsVQYk=;
        b=fAszUlT/t+XVyLby81o4QruQJBZP4r5GhKPbDIiO7jEbrh+kHwA6XzSKf1B+m7ZSu7
         5TGWGqtIpXok09qS0K3h/yqfMlv27OE386JvsghsabMnCOcoYQd1zXHRoVYQy8ftNvBE
         09vWZ+vyMsgC3w/4aGeSa+Sa/KzfDAbTy2A1hdS8sEi/m4bOUu2IgFpefOD6cRnwYRHq
         IfIWTNMFm3n1iGpHBXhPh7kqWeHZMoSfAdoEQ7ruU+6DsTplYZ9NgVXnJx74liGoxiju
         jNAsyjTHqAHHjDtIzHgvgMluGbXHn/s5FATcm7hHsp3JD8FQdnzEfIv5E2Y61f3a2xRC
         f7LA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXvDh7mhJLdnW+kUuAcsvsdNyVKSIMJWHOrUk/5jtsGWzlt04l7
	CG1TiroqX4jD5NOHs1mVclc=
X-Google-Smtp-Source: APXvYqyx/DTTAPM2jW3It2NfI4XaI1Iq4B6VjQBVLineKTAxFPXQ9kV8WFjKQ+k5Tp9RFcA3EYgb/g==
X-Received: by 2002:a17:906:6948:: with SMTP id c8mr20797122ejs.195.1556660711874;
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5489:: with SMTP id r9ls398659ejo.2.gmail; Tue, 30
 Apr 2019 14:45:11 -0700 (PDT)
X-Received: by 2002:a17:907:10d1:: with SMTP id rv17mr179890ejb.85.1556660711366;
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556660711; cv=none;
        d=google.com; s=arc-20160816;
        b=jozmdwjgFp7U65v8DO9YKn04N4Nf91N8d6IEuLWuw3gZPzYcPkBk0GxoIav2Kl7C8H
         knmL2R2sKvZ4y3dY3OOB71xRszUpLELhY//8qIyXMjTLa48GovuH1GvIWx3FrHxce0ww
         dfJW20Gt7RzHPuzS9OSwsRjCQuEZ1DSTvfV7/SRfUihIwpT78Ly07v2d1z+18C34Fne0
         5pZYW2bFGAJJTUTseqgIMoxlKHpOww4jESQWUjt66jh6hXlsC8vWUwkrsiOGccHC91wH
         75xdrzUpCDABxvKnS19wt+XstH2NBN+OKJz4xbHPZccPX3YMpbTeWFHgNsfwcvffwuxt
         8AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LLW76NftejB52OCGUh01rD2dLDQk5hfOTB3bP9NMnKs=;
        b=XhFQhWIESS/OTMcByEMVTIZrbVDw7hhGr6flhzfn/zf7nCBhKe+GgGvyg3VtKKueKn
         fpLWtfPfVQCsavD0A/YXXnO2jA/TlqozLPexoEGxZ7XotC1VTiwNDCMtRb2misdFFpS1
         PU5Hlf4IJdwZK2tzxmJYZhg8abpl40OfN/12kuBN9SSxMIJrhgMqicjIRVVRSeKYQFk7
         NkLROG8Oypc4DijRmYazS4FcFuagY3UJzpeIVKC/0LWOdiaAaOFVVlTnkwSMsy3Rvpi+
         M1T8KX1/f5xEll+BjAfAtJk3oE7JV+0TIziud8zymszQRY7lIcuSmT4gdxfHgSs8x1WL
         w/TA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h6si102427ejj.0.2019.04.30.14.45.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44tw6t5MjlzyBc;
	Tue, 30 Apr 2019 23:45:10 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 5/5] pyjailhouse: let the generator produce speaking names for PCI caps
Date: Tue, 30 Apr 2019 23:45:04 +0200
Message-Id: <20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.4.30.213616, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.4.30.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Definitions on C-side are in place, so let the generator produce those
definitions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 79 +++++++++++++++++++++++++++++++----
 tools/root-cell-config.c.tmpl |  6 +--
 2 files changed, 72 insertions(+), 13 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 4bb50605..368714b0 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -22,6 +22,8 @@ import struct
 import os
 import fnmatch
 
+from enum import Enum
+
 root_dir = "/"
 
 def set_root_dir(dir):
@@ -542,6 +544,65 @@ class PCIBARs:
         f.close()
 
 
+class PCI_CAP_ID(Enum):
+    PM     = 0x01 # Power Management
+    VPD    = 0x03 # Vital Product Data
+    MSI    = 0x05 # Message Signalled Interrupts
+    HT     = 0x08 # HyperTransport
+    VNDR   = 0x09 # Vendor-Specific
+    DBG    = 0x0A # Debug port
+    SSVID  = 0x0D # Bridge subsystem vendor/device ID
+    SECDEV = 0x0F # Secure Device
+    EXP    = 0x10 # PCI Express
+    MSIX   = 0x11 # MSI-X
+    SATA   = 0x12 # SATA Data/Index Conf.
+    AF     = 0x13 # PCI Advanced Features
+
+    def __str__(self):
+        return "PCI_CAP_ID_" + self.name
+
+
+class PCI_EXT_CAP_ID(Enum):
+    ZERO    = 0x00 # ???
+
+    ERR     = 0x01 # Advanced Error Reporting
+    VC      = 0x02 # Virtual Channel Capability
+    DSN     = 0x03 # Device Serial Number
+    PWR     = 0x04 # Power Budgeting
+    RCLD    = 0x05 # Root Complex Link Declaration
+    RCILC   = 0x06 # Root Complex Internal Link Control
+    RCEC    = 0x07 # Root Complex Event Collector
+    MFVC    = 0x08 # Multi-Function VC Capability
+    VC9     = 0x09 # same as _VC
+    RCRB    = 0x0A # Root Complex RB?
+    VNDR    = 0x0B # Vendor-Specific
+    CAC     = 0x0C # Config Access - obsolete
+    ACS     = 0x0D # Access Control Services
+    ARI     = 0x0E # Alternate Routing ID
+    ATS     = 0x0F # Address Translation Services
+    SRIOV   = 0x10 # Single Root I/O Virtualization
+    MRIOV   = 0x11 # Multi Root I/O Virtualization
+    MCAST   = 0x12 # Multicast
+    PRI     = 0x13 # Page Request Interface
+    AMD_XXX = 0x14 # Reserved for AMD
+    REBAR   = 0x15 # Resizable BAR
+    DPA     = 0x16 # Dynamic Power Allocation
+    TPH     = 0x17 # TPH Requester
+    LTR     = 0x18 # Latency Tolerance Reporting
+    SECPCI  = 0x19 # Secondary PCIe Capability
+    PMUX    = 0x1A # Protocol Multiplexing
+    PASID   = 0x1B # Process Address Space ID
+    DPC     = 0x1D # Downstream Port Containment
+    L1SS    = 0x1E # L1 PM Substates
+    PTM     = 0x1F # Precision Time Measurement
+
+    def __str__(self):
+        id = "0x00"
+        if self.value != 0:
+            id = "PCI_EXT_CAP_ID_" + self.name
+        return id + " | JAILHOUSE_PCI_EXT_CAP"
+
+
 class PCICapability:
     def __init__(self, id, start, len, flags, content, msix_address):
         self.id = id
@@ -580,11 +641,12 @@ class PCICapability:
             msix_address = 0
             f.seek(cap)
             (id, next) = struct.unpack('<BB', f.read(2))
-            if id == 0x01:  # Power Management
+            id = PCI_CAP_ID(id)
+            if id == PCI_CAP_ID.PM:
                 # this cap can be handed out completely
                 len = 8
                 flags = PCICapability.RW
-            elif id == 0x05:  # MSI
+            elif id == PCI_CAP_ID.MSI:
                 # access will be moderated by hypervisor
                 len = 10
                 (msgctl,) = struct.unpack('<H', f.read(2))
@@ -593,7 +655,7 @@ class PCICapability:
                 if (msgctl & (1 << 8)) != 0:  # per-vector masking support
                     len += 10
                 flags = PCICapability.RW
-            elif id == 0x10:  # Express
+            elif id == PCI_CAP_ID.EXP:
                 len = 20
                 (cap_reg,) = struct.unpack('<H', f.read(2))
                 if (cap_reg & 0xf) >= 2:  # v2 capability
@@ -601,7 +663,7 @@ class PCICapability:
                 # access side effects still need to be analyzed
                 flags = PCICapability.RD
                 has_extended_caps = True
-            elif id == 0x11:  # MSI-X
+            elif id == PCI_CAP_ID.MSIX:
                 # access will be moderated by hypervisor
                 len = 12
                 (table,) = struct.unpack('<xxI', f.read(6))
@@ -637,8 +699,9 @@ class PCICapability:
                           'Extended Capability ID %x' % id)
                     continue
 
+                id = PCI_EXT_CAP_ID(id)
                 next = version_next >> 4
-                if id == 0x0010:  # SR-IOV
+                if id == PCI_EXT_CAP_ID.SRIOV:
                     len = 64
                     # access side effects still need to be analyzed
                     flags = PCICapability.RD
@@ -648,7 +711,6 @@ class PCICapability:
                     flags = PCICapability.RD
                 f.seek(cap + 4)
                 content = f.read(len - 4)
-                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
                 caps.append(PCICapability(id, cap, len, flags, content, 0))
 
         f.close()
@@ -674,9 +736,10 @@ class PCIDevice:
         self.msix_region_size = 0
         self.msix_address = 0
         for c in caps:
-            if c.id in (0x05, 0x11):
+            if isinstance(c.id, PCI_CAP_ID) and \
+               c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
                 msg_ctrl = struct.unpack('<H', c.content[:2])[0]
-                if c.id == 0x05:  # MSI
+                if c.id == PCI_CAP_ID.MSI:
                     self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
                     self.msi_64bits = (msg_ctrl >> 7) & 1
                 else:  # MSI-X
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b80d7889..b4d64adf 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -196,11 +196,7 @@ struct {
 		/* ${comment} */
 		% endfor
 		{
-			% if (c.id & 0x8000) != 0:
-			.id = ${hex(c.id & 0x7fff)} | JAILHOUSE_PCI_EXT_CAP,
-			% else:
-			.id = ${hex(c.id)},
-			% endif
+			.id = ${c.id},
 			.start = ${hex(c.start)},
 			.len = ${c.len},
 			.flags = ${c.flags},
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
