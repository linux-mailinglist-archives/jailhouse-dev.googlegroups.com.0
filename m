Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBUFNZDWAKGQEEOQKDHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC1AC23A4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 16:53:05 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id p14sf3096522ljh.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 07:53:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569855185; cv=pass;
        d=google.com; s=arc-20160816;
        b=CaieJsIXc5+0BQszhR82/B95kxMgsTSyJs47PnaIlUM2hHwmw4x3o+LoYWKK4acSA4
         gZgXMR0ZaGduZBUPaRODrKujKBDu3RsoT/xCUmVsFyy0S96PcsVV/nT935Pxq2cCnjAq
         sKX6h0Atrp5UiOTcQ0OvrqZboz3Scqqs4MItwRJP7CjUO2PDdD2RbGz28bQ2wCr+/Tn8
         PKq/3jfcl6FrvgotruttHxOquPUeMSqymfOCfB4F9kh1CZ4hpwonkDAT5d3xQukP4ASp
         BZNGc0K/ZnO9JJAg1zk37ZVr2ik414zpa3CnrMW7r233OnDhja7wPNXlON/FdkVNicxS
         CQsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=vxJEYIcMrTYDfF7J9rpbsS9uNNBgpbTFdH67F/t2lIc=;
        b=RBazantCaWSl0YXuuchHqWqDZW9OYcKFtylzAJcpXiK+BNkpLaROHw5pz9wWFhjvDI
         3GMLZHad6EIe64TdVJ47dQUqBUcHMPKroYd9zkFgh7z0awmNPMR85niDrSgYP6wwTv6s
         o4EtxSYc24NJwPg2+elvb5cWLeY9bE5NJ3AJLxOgh9FF7DSZn58zIyHe5puzGZh2S78D
         5ZuPF3UjN2525NylfeyizTVQq33i0IA/SnU/FS4k19H+Yv9VIkmJNlgFqdEI7MCM6Ak5
         ODgy7yVhLiHaIKbnrjwcdDHDNp8Z2KS3dBzf9aIarfSR4quLN4iPhk5hDh4LFVlPnZUJ
         hZUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Lg2lqSGC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vxJEYIcMrTYDfF7J9rpbsS9uNNBgpbTFdH67F/t2lIc=;
        b=aYv+x8jQva8kg4EPbcUQkB7rUCPcccFZV8YEMKAKgB3nPd+QClbxfhERgegq8Fv3sR
         arp/mICygnvh/DnpZSW049dqErlruzYE4SPrwfwVb6Jn10Kx55eMwB2S8MtHMcOWFX3C
         PZFhA6Jyp1/qiFP3eJ+7GI2dJwLEmsGmH7K5oPkkrd6xgkDPON+hfzwc7rq3CegwlwUu
         JSo5Wsm+Lu0E6OejyKXgHsn+kl0sHDQWvlaw5Bnr+42B2Mg2TmClQD4Fa1OMGbHWrmRp
         RnhnKo4nJpATusabd3EhigLswARKSVL77cP+Tenm0yqbOfmDK3sWnKO8ZIbrEFtikyUg
         Pgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vxJEYIcMrTYDfF7J9rpbsS9uNNBgpbTFdH67F/t2lIc=;
        b=HKtjWtU3+gbboKVPu+KVaHJRQLhfrAgko7453lLZraxu1WEPOnmt/h/fZEDX5QwsAs
         jITPPCzTTcyW+j45wFDyytBluKcUJBG4b4FbDcDWfWs8CPiat8TEAB//JhXoklf9q31N
         9/goUk8pCW6k0xyUbzTyXf2k14H5fQ8pFKrYQtBYutU4W8vIPPqHa5EgGWH+dvGsFJYH
         jhgmB3AN4mhbZg4ju6VDxk7gyCVKSKMw9rP8Gs8PrPlPQ9fryAIdwgL8L/IZ1JzDE6/q
         cmDo/Dme/YhAV4ORStZYat/6pxDy2YM4Yp6CYnfKwXSumxV9bFleBqatDUh6N1XX4pn3
         /T+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSQ45KwtIQETpCidcFjZBju/5ApxmyxzlSGNQASMoCsGuiVBXW
	Cuxg+REvi19OlCrnM12A+vQ=
X-Google-Smtp-Source: APXvYqy+ro1NoOKMCL97SvQjX6YNXtEEog+O3W/Ug4s7BiXl5ocYx+SaXX+Jqa3QK+OHWztotNOOrg==
X-Received: by 2002:a2e:2bdb:: with SMTP id r88mr12381845ljr.82.1569855185068;
        Mon, 30 Sep 2019 07:53:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9246:: with SMTP id v6ls1545511ljg.6.gmail; Mon, 30 Sep
 2019 07:53:04 -0700 (PDT)
X-Received: by 2002:a2e:a0c5:: with SMTP id f5mr6315100ljm.114.1569855184306;
        Mon, 30 Sep 2019 07:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569855184; cv=none;
        d=google.com; s=arc-20160816;
        b=dRkG8YrHLNnwoP/ayiPg1e70UHbYVq687lXCZySNdrGUWuT/PfArl7xQGfznhctvYM
         WIUKWYHzfycW4Ate8ApifFAJ6bxdfP3gG+Pz0kQygkK2WXE/2xM3FM71seagVRmh3+rU
         Zq/ibe00brWE7LfU2adcONTvecAtqqdOpH/QJtK9ypWmpUm5h2/VUNKcRtG2BXCmmCuh
         zmNpzY21MI9oSNkO1sP7sdmHT9YyJNHSqSkJoZzsFybAvF67GVIDfIeaiX/FnYI1t+Mz
         gY9g5R+m4VDCmWMDrSEnnNw0aBJzl1EwoMyPxCgPkVaA743FN6LURShf47VL6+mOirNp
         tbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/FkS/qml7JpV7+w/+swLvY6jYf0mUNEBQcdAKmX3KX0=;
        b=jTnYrB3Lkm/dN9XWNjEUCLG2LGUzECk5+dEKpMUXzsQvOCo/jV4JFS0j2EAGHDJ2EP
         a9sCCEW3U/DcN6ZM4aZPwVEYaBqztnggmF9muU3cmVjU65aOj/kI8g5uEWvf1bJdtWdU
         qGKb12FbTKBM/ue3TENFeLdqzxBLxAt5N/RglOn3Q1YLs4qLtdyFjMPKXiAfq0UXHOnE
         LjcvLFuINNAm01xnjFLV7sLGnUOG+FffX8v0FXWxHZHuMYG/n1OyPiuqu4R6uS1RTo4A
         0g2GmYsb3AuIYs9lSat7UalCQFjIHQsGqVtcT0PnEJ385L55JGiLZxZIq+XUXBiEIVIV
         fO5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Lg2lqSGC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id o30si695253lfi.0.2019.09.30.07.53.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 07:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hlkl0G3Kzy7Q
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 16:53:03 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 16:53:02 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH] pyjailhouse: Remove superfluous definition and fix linter warnings
Date: Mon, 30 Sep 2019 16:52:39 +0200
Message-ID: <20190930145239.16506-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Lg2lqSGC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

'vector_size' was set, but not used.

No functional change.

Fixes: f6fef92ffaba ("pyjailhouse: sysfs_parser: Add more precise length of some extended caps")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 67dc85d0..e6b07716 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -490,7 +490,7 @@ def parse_ivrs(pcidevices, ioapics):
 
             regions.append(
                 MemRegion(mem_addr, mem_addr + mem_len - 1, 'ACPI IVRS',
-                    comment))
+                          comment))
 
         elif type == 0x40:
             raise RuntimeError(
@@ -665,13 +665,13 @@ class PCICapability:
                     len = 4 + (vsec_len >> 20)
                 elif id == PCI_EXT_CAP_ID.ACS:
                     len = 8
-                    vector_size = 0
 
-                    (acs_cap, acs_ctrl) = struct.unpack('<HH', f.read(4))
+                    acs_cap, acs_ctrl = struct.unpack('<HH', f.read(4))
                     if acs_cap & (1 << 5) and acs_ctrl & (1 << 5):
                         vector_bits = acs_cap >> 8
                         if vector_bits == 0:
                             vector_bits = 256
+
                         vector_bytes = int((vector_bits + 31) / (8 * 4))
                         len += vector_bytes
                 elif id in [PCI_EXT_CAP_ID.VC, PCI_EXT_CAP_ID.VC9]:
@@ -679,7 +679,8 @@ class PCICapability:
                     len = 4 * 4
                 elif id == PCI_EXT_CAP_ID.MFVC:
                     len = 4
-                elif id in [PCI_EXT_CAP_ID.LTR, PCI_EXT_CAP_ID.ARI, PCI_EXT_CAP_ID.PASID]:
+                elif id in [PCI_EXT_CAP_ID.LTR, PCI_EXT_CAP_ID.ARI,
+                            PCI_EXT_CAP_ID.PASID]:
                     len = 8
                 elif id in [PCI_EXT_CAP_ID.DSN, PCI_EXT_CAP_ID.PTM]:
                     len = 12
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930145239.16506-1-andrej.utz%40st.oth-regensburg.de.
