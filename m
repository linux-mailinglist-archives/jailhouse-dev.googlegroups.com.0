Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTN63H3AKGQE6Z3M3JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B81EBDCD
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:45 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id l2sf912319wmi.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107405; cv=pass;
        d=google.com; s=arc-20160816;
        b=AiOciKYylCkpbe63s3QHr+3YJ+JVYLWg9K/GQorRCwk8WNg7D/9CPTz85mPSavfE9L
         +NbGo+LPjgzA7F5MbqX3MneTiyBJb/zZAHolLxdVY3llCfoVYU8YRdNGHZzEd7yw7rzv
         DHcQkXgRnQlzJFz7NsyFuzrjZbLfy9veuqi5su0hTYQmgcyi8eqZhbs845lx809W75wn
         rOvYf1FJbRm7Xz4txIITBlVQoFnWCML70E7inHVUSdvPtiIjF/b5ZmCEIyp6VC3otnfD
         ajSbZDDkrzUadPZsWKztx9qOLRAty5ICvx3VCIrOcS3/KH9aNS/Ty23QKEcS9yjsnf+O
         Qgzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8U7XKU73P2m0X1OxNLgVRoqO+cHB4qaIVlRbbzBGfvw=;
        b=hJA6FAXWNSexw2R0C1VF/lNPNUZacLLXnqxhLtouepHOI3hGgvq9RnI7z56B5HFA/1
         zmk3YNF2O5hjF1HithipyWu/c2dIk2ohg0/2UbpBqHFmxXO0H+WVO8stPc4R67vqtYua
         1A09SifD2wG/rYbJATftXjBcayB+ZsH8fWZlx2V7yyzcNb+YL3NPAuoIQHY8n07Vd0fx
         cLSaEUQboNAjJaarBD35q7RiGLjwbOrUjwPKUxfifLGinqtC5ACQvFgkv3MgxlE/SLWM
         +VpuXx2C6xagUBpYd0qr+D/aV5qmVgyDFowa3xN0MQe3zIRghYxSkiyZH+DmDSKpcV5q
         Eepw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8U7XKU73P2m0X1OxNLgVRoqO+cHB4qaIVlRbbzBGfvw=;
        b=MkgJxesgr1q51UmHURFcZaKKAuyptMTOMJ3SdnMyXJWLeia5Cp7Io3sv8bumWgZ3XA
         jK/kEpKwDlsuzHMkgtBMaSPXOcdptRL4TvJCw8MRfTzznOL4hj/39M9xk9dRftXbZ+qK
         EAP4YBMAI/0AE8spxs6VarjiVhrWUy+KggBxcek1zWxwJ7rmfvEg56e1uvyZIYnhUIvS
         IheYqjeLdO4j/tEoTygxtFBPNMQSRKQZAGfbYhHrAd+az1msWgwQl5jrFU2uFZPVih+9
         oUpaoFxX1wNhQNZPY2iNQjYOghMUYd0VjbqHKqurpnS50sw9GZhKioILFONJVgWcYeca
         eSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8U7XKU73P2m0X1OxNLgVRoqO+cHB4qaIVlRbbzBGfvw=;
        b=SJ7OKqKRmMsFjxjuBAABlt//7/NxBW0C/DZAjPwPnGFUlrgnLtfDMQo/AupC5luGO3
         Ig8sNYY0UZqmtVKBtEEabdQ1y9+g7qfifFmcQYEkZw8kybBj8olmU6Z7RJmTDB8XSprk
         gponlRlVTAxNSoWUL9ilTAcL4p89aiByD0T5piqHcMBvZxS4S+h63QjDNaVe3ji+I4go
         6ZSEem/wmNfvMyzzOLxBS5IxOFIW/QuLK/56woZse6exueZvSe6wuCMEp3eUoDyrl4b2
         m5nqZldTBa7g7OckNZ5WNAdApP2ET0u/T35fOe1jbH+Rd7HouunhNeDjph3uZvSpka/I
         ZymA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318mjUVhZ5UuUCfw767S+/4U5wHqYp9ly0RsPR9qySVizLMYNHr
	64+QD+S5VnSPEiBcuDx6TD0=
X-Google-Smtp-Source: ABdhPJzcpbd/6jMIh9nZbOc/ZTeaG9Tw2KYRtu05I7v/SmSZBntXooJQflOKWQqjRfOK1nyfpT5p7Q==
X-Received: by 2002:adf:f882:: with SMTP id u2mr28414293wrp.40.1591107405676;
        Tue, 02 Jun 2020 07:16:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e510:: with SMTP id j16ls5076533wrm.2.gmail; Tue, 02 Jun
 2020 07:16:45 -0700 (PDT)
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr28440024wrh.254.1591107404970;
        Tue, 02 Jun 2020 07:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107404; cv=none;
        d=google.com; s=arc-20160816;
        b=FTJ1OZUNYcaCZXaQbXNNV2t5eeHGhNEkAgee1vc3s3kNxgSMwPKQK0jx1O7kjeA/JL
         zFo98YQ/IjF23OfJ8lg1jTUsk9akhT+RGD87YNf/aonKGYY/xwqeasOmx2rlQ+UYhgoH
         dY2GHnGCzUJ+IQkSsTNlGImVTGXnzOmsZxs71skYTFx8JZg43RJyAr8gDcCDF211nQmR
         wipJHin9SpqWhgq+gT+weUuKLpjV/3HenS4m062DHNnT8clAvHSH+jBKzY6FfVnVg3IJ
         B/MZF07ThCWGZ52fHdA2LfMhFfCUPJ2+jkamMrUQcxMjie8iHrTjMlpJo1TQWcZ6UO/z
         8/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=lGQ0OGapdTRqLNlFg0xswIPJ8zuqpBAL+v4AQLkv858=;
        b=Bnuxl2ylhKKNV4JiaDKenwzZbnZNzar46kdtKGaBzaXwXQQI7K0dZr0hcH9djTTiag
         KBvch/4SgMsRvvGV6YXpihkiKN3IMxgAnbjgPzvbyb5f7i6srhii01DCVyeKLkXDN0lF
         mmNgWGwE5LCPFgmemPp/K9xwlVppKw2jQfLV6igmX3LsUqTZIaQGailgZ852BM2qiRjQ
         84ic41q+zlcgxImiYAB/cgTaF5zxomg8ayUe0ePYaCxHJfJVA+qGpMWQQemDdm6t3Q4e
         P7LkynLcno5QQ2AXyTfmUtvn3FuyHnhIyHreCOugDIaCenzqjNaTxfLn/IcjUIA3fR4+
         tHTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 12si183965wmk.3.2020.06.02.07.16.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EGi7E011449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:44 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdC028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:43 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/15] tools: jailhouse-hardware-check: Clean up dead code
Date: Tue,  2 Jun 2020 16:16:26 +0200
Message-Id: <e3747ae41359a3b0ef1c0eec9c75895e30c2d555.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This became unused with 064cfe3834cb.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-hardware-check | 48 ----------------------------------
 1 file changed, 48 deletions(-)

diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 375816e2..9e90250d 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -11,7 +11,6 @@
 # the COPYING file in the top-level directory.
 
 from __future__ import print_function
-import collections
 import mmap
 import os
 import struct
@@ -122,53 +121,6 @@ class MMIO:
         return struct.unpack('Q', self.mmap.read(8))[0]
 
 
-class Sysconfig:
-    HEADER_SIGNATURE_SIZE = 6
-    HEADER_REVISION_SIZE = 2
-    FLAGS_SIZE = 4
-    HVMEM_SIZE = 32
-    DBGCON_SIZE = 32
-    MMCFGBASE_SIZE = 8
-    MMCFGENDBUS_SIZE = 1
-    PCIISVIRT_SIZE = 1
-    PCIDOMAIN_SIZE = 2
-    X86_PADDING = 18
-    X86_MAX_IOMMU_UNITS = 8
-    X86_IOMMU_SIZE = 20
-
-    HEADER_REVISION = 12
-    HEADER_FORMAT = '6sH'
-
-    def __init__(self, path):
-        self.config = open(path, 'rb')
-        data = self.config.read()
-        signature, revision = struct.unpack_from(Sysconfig.HEADER_FORMAT, data)
-        if signature.decode() != 'JHSYST':
-            print('Not a system configuration', file=sys.stderr)
-            sys.exit(1)
-        if revision != Sysconfig.HEADER_REVISION:
-            print('Configuration file revision mismatch', file=sys.stderr)
-            sys.exit(1)
-
-    def parse_iommus(self):
-        self.config.seek(Sysconfig.HEADER_SIGNATURE_SIZE +
-                         Sysconfig.HEADER_REVISION_SIZE + Sysconfig.FLAGS_SIZE +
-                         Sysconfig.HVMEM_SIZE + Sysconfig.DBGCON_SIZE +
-                         Sysconfig.MMCFGBASE_SIZE + Sysconfig.MMCFGENDBUS_SIZE +
-                         Sysconfig.PCIISVIRT_SIZE + Sysconfig.PCIDOMAIN_SIZE +
-                         Sysconfig.X86_PADDING)
-
-        keys = 'base_addr mmio_size amd_bdf amd_base_cap amd_features'
-        IOMMU = collections.namedtuple('IOMMU', keys)
-
-        iommus = []
-        for n in range(Sysconfig.X86_MAX_IOMMU_UNITS):
-            data = self.config.read(Sysconfig.X86_IOMMU_SIZE)
-            iommu = IOMMU(*struct.unpack('QIHBxI', data))
-            iommus.append(iommu)
-        return iommus
-
-
 if os.uname()[4] not in ('x86_64', 'i686'):
     print('Unsupported architecture', file=sys.stderr)
     sys.exit(1)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e3747ae41359a3b0ef1c0eec9c75895e30c2d555.1591107398.git.jan.kiszka%40siemens.com.
