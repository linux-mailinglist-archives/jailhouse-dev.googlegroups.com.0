Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUV63H3AKGQE7EHAEVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 967281EBDD2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:50 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id v23sf1018944wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107410; cv=pass;
        d=google.com; s=arc-20160816;
        b=IbwndWjykXzMwoVvg1U6OByuJ3IKePT6R3NtZmFUFx2+iiJgRsz/kDdV9xkRZTdt+L
         PD6/GGFBoAzteOBjvIXLSjFmNVyAvsM1QmCNSR2sVFIpWcmixid/pv2S1vQKRtx3KyW0
         Oj2sg4zxdPYK0xk9y/OOzDXbgFjTxGUUw17x9JHaZXN0qNqJH+qt8EgOl78yhovz8dmF
         8FUwY71bmXJkvFifQXJR2UCBFHr4bk7eb5X14nB2IMeRPy0yndAG7dm97XptadRLS/IC
         lyz10S8GOKIievv4vQtgHgnrMjAU1WSGEKZ+HyLU8s/GqulCFMfp7SV6FzFE0HE7GRGM
         c9Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=waiR9MdcpGhwzmaQOA/oLPpf7Mp0xMcFQAj+p00k2rU=;
        b=GhL+n9xjnxWmqh3O5dWvnF10q5NGVqeX7jqitnoNZsz85vC7uNljHwzgOU3q/jX/Rd
         eg2o1pmLEYFhBVvNpx3YIFVyv0yqRbkhl6dAptS5VcV+wjurL2G94zV59pJoAegzML9h
         KtJcHDjTqR0efNVD/c00w7OcsFnHhCTsF9fgGFBGkEZihQQgTSqgxeukdG0EcFmXzEm2
         r0XT1mtgOUZ1neqniiYuegIEBa/yP24HYFUx8oD32MgECzdXVgsq4GPevesdwrku9NnG
         PbNX8GHItpsNaDhovEzbXytzeiucVz+WYdVJAR4bcja48V+LfR1iZzuG8M9glSG0CtIX
         nVSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=waiR9MdcpGhwzmaQOA/oLPpf7Mp0xMcFQAj+p00k2rU=;
        b=YLG6E/TyB/PtrnV5woDdiQQmPQ6X5j5oOY1D4G5uKiYseJsp5Jg+uUXq7QZAVZGo+z
         5uEYzdZIJ9dV+FVgx1Bi5FoPsETHmDLx1nDuOVz9S9RxDX+cSsTIgQxvgpB/ssZhdrC4
         Yx8LQbJiNlLWCYEwgp0HPYepzeFK8VEwRMegXJ2S7r1TexHVCahdqPEVWC1ZhEarINU2
         p1Ne8JsrLGFnwjKLJxARBr4O747X+LmZ85qUR1GZ/OYfmRXGJQ8q84wkdqbbX9LGRIVu
         CZXX03zGrKg2+rFSgjcxopQ48WJMr+GnTiEySWSByuVOn9LMHvHJTJu+snt8aM6FrZ0Y
         uxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=waiR9MdcpGhwzmaQOA/oLPpf7Mp0xMcFQAj+p00k2rU=;
        b=dFwdemT1QAzkyWMgwDoFN1FIDzhZw4PjeHT49nw1uEt80QUT2nKeVMuEW+Wiw1Iq/w
         3gmbkg7VWhYmAOrnLL9E+9RkzDz5ZqdlJwL/RGw257MkoJegXBr/CWEp6l3biut7PYER
         NmlVgJPa0hUpQmkGDLEAarGu4RlJCiU+/k0eAlAyJv9hkLUVNZCI9Ih1/pIHV+k/c/mB
         jL5j/9vlq2WTme+Nmb6aNpB1H8f2Kr1fC/iVwsnsCdh8cBxka2a8enAA5eI+Jxtr5Wxe
         iJPKMVU2CEHwtvNo8SFc9fTJjxY9Cr8Oikrd13LgtGrQO7dK2gWPArJnm7iTFGGIrzUi
         i+0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532KsMeoRMaTYr6RQ+D0tHfsKAkJsaNWYnKHbYUf+lnBwLiDBcbt
	ANanlBtEeOsi5YnH0Bo1i5Q=
X-Google-Smtp-Source: ABdhPJzrtmRdFCuGvP+EXUJ11phROE9JnqUeaX50YW9jjrqshxO0XDjzvCROVKzwPOsNFq4Rjj7SIQ==
X-Received: by 2002:adf:f882:: with SMTP id u2mr28414588wrp.40.1591107410390;
        Tue, 02 Jun 2020 07:16:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls1655735wml.2.gmail; Tue, 02 Jun
 2020 07:16:49 -0700 (PDT)
X-Received: by 2002:a1c:7f44:: with SMTP id a65mr4578472wmd.53.1591107409643;
        Tue, 02 Jun 2020 07:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107409; cv=none;
        d=google.com; s=arc-20160816;
        b=dacEJU7iDHVng+m/9/kfcor0/s6wB/O8rciEe85evnS5UjH3ssaHOlEmcplm5Y27Rb
         gj37aVhAXf7jnE4WUTIU9RBh7vtcgOY2vR57VzoDA0dYwR01mAq7hd+sdZFQTJ+iqM3k
         m+9Blla2qu2PxP9PjP6xD5EqpRmZ9NgS+iVFGMN070xJQ0yx3l2UucFHEQnfXRa7vKge
         Xt5rhdiNihyYlKNvADtCx8rRWHah2kxGcqrZz36Iklfdx8c3vBhoHO6vc0ZHooeCiCH+
         K1dc3sV64Xy03mazmtNnf2gZHKxIFWtjrh7MBmWQQZG0AaMRlX7acNxNK3Zg0ovQla7N
         QzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=umUrgNGZuUD50jnd2fUDsJTQ7uGEq5KjZnLiswHcg8E=;
        b=nVB3GxhBqWMPeUbA/NZKLnxTlvEkNsHYaqjcgtUVSi9A6k5C12X/uywfZDPIFceU2g
         qvv7i00vOLrIA8y4M4cxKgo2hTRvsLdn+5hhxDdOF7bFlTQjBd2M5miAkWdgKuOD1pv5
         ijkUR5y/UHwIRRntRtkHIuuhi5vndOKLBUu0GZDb7cGpUyrk1edI5bls93qeqwpvZmcR
         0zDCLt9o/JvmWOYCk3Lx9UB/9S15eYDoWsORHIShflCGb7tzdiYV88lSjskkM9/l90BK
         nJm1RELecNEZeRIDPgBzJr1N67vMxzbMavVrFRlnT+aUbLcawh8DhMDg+b0/P70xdwsP
         uLmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id g7si137924wma.1.2020.06.02.07.16.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGnwv000765
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:49 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdG028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:48 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/15] pyjailhouse: config_parser: Convert memory region flags into ExtendedEnum
Date: Tue,  2 Jun 2020 16:16:30 +0200
Message-Id: <7b384de640f64a259086b900d4693b63558cde75.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This will allow printing them by name. JAILHOUSE_MEM also inherited from
int so that arithmetic operations continue to work. Ordering matters so
that string conversion is provided by ExtendedEnum, and we will only
fall back to int for integer representation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 53 ++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 2d0967d5..9d264d19 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -17,19 +17,32 @@
 from __future__ import print_function
 import struct
 
+from .extendedenum import ExtendedEnum
+
 # Keep the whole file in sync with include/jailhouse/cell-config.h.
 _CONFIG_REVISION = 13
 
 
-class MemRegion:
-    JAILHOUSE_MEM_READ = 0x0001
-    JAILHOUSE_MEM_WRITE = 0x0002
-    JAILHOUSE_MEM_EXECUTE = 0x0004
-    JAILHOUSE_MEM_DMA = 0x0008
-    JAILHOUSE_MEM_IO = 0x0010
-    JAILHOUSE_MEM_COMM_REGION = 0x0020
-    JAILHOUSE_MEM_ROOTSHARED = 0x0080
+class JAILHOUSE_MEM(ExtendedEnum, int):
+    _ids = {
+        'READ':         0x00001,
+        'WRITE':        0x00002,
+        'EXECUTE':      0x00004,
+        'DMA':          0x00008,
+        'IO':           0x00010,
+        'COMM_REGION':  0x00020,
+        'LOADABLE':     0x00040,
+        'ROOTSHARED':   0x00080,
+        'NO_HUGEPAGES': 0x00100,
+        'IO_UNALIGNED': 0x08000,
+        'IO_8':         0x10000,
+        'IO_16':        0x20000,
+        'IO_32':        0x40000,
+        'IO_64':        0x80000,
+    }
 
+
+class MemRegion:
     _REGION_FORMAT = 'QQQQ'
     SIZE = struct.calcsize(_REGION_FORMAT)
 
@@ -41,20 +54,20 @@ class MemRegion:
             struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
 
     def is_ram(self):
-        return ((self.flags & (MemRegion.JAILHOUSE_MEM_READ |
-                               MemRegion.JAILHOUSE_MEM_WRITE |
-                               MemRegion.JAILHOUSE_MEM_EXECUTE |
-                               MemRegion.JAILHOUSE_MEM_DMA |
-                               MemRegion.JAILHOUSE_MEM_IO |
-                               MemRegion.JAILHOUSE_MEM_COMM_REGION |
-                               MemRegion.JAILHOUSE_MEM_ROOTSHARED)) ==
-                (MemRegion.JAILHOUSE_MEM_READ |
-                 MemRegion.JAILHOUSE_MEM_WRITE |
-                 MemRegion.JAILHOUSE_MEM_EXECUTE |
-                 MemRegion.JAILHOUSE_MEM_DMA))
+        return ((self.flags & (JAILHOUSE_MEM.READ |
+                               JAILHOUSE_MEM.WRITE |
+                               JAILHOUSE_MEM.EXECUTE |
+                               JAILHOUSE_MEM.DMA |
+                               JAILHOUSE_MEM.IO |
+                               JAILHOUSE_MEM.COMM_REGION |
+                               JAILHOUSE_MEM.ROOTSHARED)) ==
+                (JAILHOUSE_MEM.READ |
+                 JAILHOUSE_MEM.WRITE |
+                 JAILHOUSE_MEM.EXECUTE |
+                 JAILHOUSE_MEM.DMA))
 
     def is_comm_region(self):
-        return (self.flags & MemRegion.JAILHOUSE_MEM_COMM_REGION) != 0
+        return (self.flags & JAILHOUSE_MEM.COMM_REGION) != 0
 
 
 class CacheRegion:
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7b384de640f64a259086b900d4693b63558cde75.1591107398.git.jan.kiszka%40siemens.com.
