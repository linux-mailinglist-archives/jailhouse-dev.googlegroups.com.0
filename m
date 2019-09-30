Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB4VHZHWAKGQEE5RGR6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 68177C262A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:55 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id j2sf4927998wre.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870835; cv=pass;
        d=google.com; s=arc-20160816;
        b=rZ4fZTC/oMc+oZzb2EDELbEGj900BoyHfvXWeJJH6oS0tgE1d3rqtpCnxgWo6u0Enp
         yjY9MFRdS7VPeOnWczatHL4XgWCYbxN+5mCdkpAI68i0jIdxSrJbrjLWFxsxwDKaoQNf
         i/dSGnWgTtOY8tFs13IhvQ4vC8asCJDidKOylw+bbg1wNfI7E/KeweLKat94IoruOu5r
         IWqrMW8zB85B0rdM9/NGcqXyraKb0h+INscPuSikg/3tA2MdVKs0JXch8DgGHFabVAL2
         j9MjC4S+xm8EbVZYZuAfuPDgdKpwUUFCxm4GdxYtv/wM9M1A08nZiOw5p9DUZYhAOx92
         LBgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Wa17VX4O2OEL9tIDPvQ9qqSHbWpRk0y6moyrL7WGFBI=;
        b=OzgVYPl+eC87SUQaLc0xKWF17NeFuQA2EE0OaMVpVrSXaLR29bzvHyQvmP9DVEnP+X
         j3qfeLg+FYzSEWR+/u56cN/8aSSmbcaQwfSMVWbw9iRDf1QL6mW2lohn0v1kY4bIEfTF
         3XmbZem5qeNWIM3tDZjrJ3JNLlerZVTE9XSY0rKNXfyB3luEsy2t2ucXxu/1YvKgNuoP
         yd4G5shABCrskz7YyKaDKWBLWl4r3MJKhVwDEPSqxrVIxcW+N9hOAT3N7snbHjVojZHD
         nrfpvkpLA3uYaiUa6ePQiItthfUykCHmNJzf+52EVlq/fj9i5ZDnrtFyMkn5trEqwVjX
         O4eA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="ajmmg/+O";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wa17VX4O2OEL9tIDPvQ9qqSHbWpRk0y6moyrL7WGFBI=;
        b=ZYVJeJUiiiGe+qbZgSXvZw8oODn2qNbCrhlU60UMMDDwz+ffVlXoa1baonHOVj2UW7
         PRgoHu9fAcN1lszFuETh6Z9tFplvTgY6Ox034FZLev4uTUeFfbKUtS2kqpgFji8MzvFw
         yLwYrFiV8qTM391e3XJK+0qOMSUt0ev0RTKs5JxXm1RN4FhWZCfS3DDDz7ozONAWJ6sO
         JzqUxOnQ6Rupwcn/RcNmhxDcbqkyfvikgRrQL4tb8E3ePyHDPS9MxYiebCt/oWcGsPxE
         EbV6h3PutmHp6hfaORaPi0HPAoBxCm2rsZn1PDVxTFlp4INCX+fsP40wiaHoQdML6uoe
         Ft0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wa17VX4O2OEL9tIDPvQ9qqSHbWpRk0y6moyrL7WGFBI=;
        b=YEjPYn9Hr7JDTgq95p3MjSxLyvb8k41M+XsLmlDOb16+HYDWyc9pQrmyr8uxPKlJ62
         GyA27iPOzrzsb3rs7m3MzsVdMEia03UQtR0md8s25J2OoR0S5iUkPGGN9u8gScp3gwoU
         7aJEbbQPGbDsNH0a3LJLp5Y5h0sX+uIsHqmtqLQFACptG8y+6oF8uHGIFCgEbS4ZO2/8
         0yY25H8YLbpVGsUH4yxWs1zot1aCtSBvI+Rd2WS5JQFxKUCqccVpJnPzNlgQfIcazZv9
         J2GJHYcWDNFvAeEIOIdz1BHcqOSjdmHuAvQclb6hncqLbX8PKSdjiCAOIKZRUVSRJqao
         eVuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFdP/vigA5JHv4KWjFP2pORcNCI8mVZKl8Ln++j970IuKMJRWZ
	n5ER7bvGpgf0+Too+Kw3xWw=
X-Google-Smtp-Source: APXvYqwgCk2b8fKqo3sQ/tHX9V+gBx/4FbpkVk4kp0u2OENp5x1Ir0oP9qk37UJ8Riyu6FIIUJou9A==
X-Received: by 2002:adf:e50e:: with SMTP id j14mr1593681wrm.178.1569870835138;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dccc:: with SMTP id x12ls3369404wrm.3.gmail; Mon, 30 Sep
 2019 12:13:54 -0700 (PDT)
X-Received: by 2002:a5d:4dcb:: with SMTP id f11mr14968849wru.239.1569870834608;
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870834; cv=none;
        d=google.com; s=arc-20160816;
        b=SAt/j/kAQNSU6FaCut0rvLhGFnV/cZPVE3nHl9fQY+9C9ClXXMrV8g6kmaL9ui+hI3
         8rV1dxnNOt7KpiMHsxsAOoDw2p+2cZH+5yb1fEviPnWciZ9OMgdmejiotIu+hijDzB+L
         qlXYIMGL7Kp6yPw0mq32qZ/Ex7oGO648K18myNVpcz290XhTOl0G5jotM4nPUxpB0H4L
         pX6ugCYX1hKaGGoR8HnMD12vUV5NRfD3+PPR8JqkIraGHqbdbhJG5pCaRlm9qVd/CoAZ
         n95f1ttmmBZKQOt7N/MqK4X87rL1TETabRvQVgNz2oEeVx7iWcMKUr86S/e58YLy8JuW
         wZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7wXuQ2I8Xp/tjIqSt7MikZ7fJoWZi4AOYARbTP59k1Y=;
        b=JKOM9/5iG1wUp0MXFz7RBJG1SO+BehNurpMU/iG15SZfZfiMZ2uD5O4u4mgAL2bChR
         K8vgzrgvPrE9TW1xk2ZOEg7qTkWKrWo+hdRhIH9ChhGI/I4gpTSZXyvDO3Ip11ADvKLf
         C/cSKwB9WJbpe8mzZQC2swnmy3xlMlUTyXQzmykaUsmBmfhhoJ+S8aAfg1kB5IoY/5bK
         tN9XIr8dfPfv/Edd5uTLq0YLJ+E8X3S80MEMmHfLACALJmtqtq1d02/19BuhnEZQ+Ygt
         gPHdQZIflv2MUDC2WysWN/VNtGZEICGA0guwuEfczrJnFkzVGfI2kvJN4SRewHyqxWfR
         S3Uw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="ajmmg/+O";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x8si31908wmk.2.2019.09.30.12.13.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hsWk24Sczy6H
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:54 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 02/14] tools: jailhoues-cell-linux: cosmetic fixup
Date: Mon, 30 Sep 2019 21:13:10 +0200
Message-ID: <20190930191323.32266-3-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="ajmmg/+O";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Just for the sake of consistency: s/memregion/mem_region/. This is the only
spot where we still had memregion instead of mem_region.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-cell-linux | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index e43f8e42..007a5c46 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -603,15 +603,15 @@ class Config:
             exit(1)
         self.name = str(name.decode())
 
-        memregion_offs = struct.calcsize(Config._HEADER_FORMAT) + \
+        mem_region_offs = struct.calcsize(Config._HEADER_FORMAT) + \
             self.cpu_set_size
         self.memory_regions = []
         for n in range(self.num_memory_regions):
             self.memory_regions.append(
-                MemoryRegion(self.data[memregion_offs:]))
-            memregion_offs += MemoryRegion.SIZE
+                MemoryRegion(self.data[mem_region_offs:]))
+            mem_region_offs += MemoryRegion.SIZE
 
-        irqchip_offs = memregion_offs + \
+        irqchip_offs = mem_region_offs + \
             self.num_cache_regions * CacheRegion.SIZE
         self.irqchips = []
         for n in range(self.num_irqchips):
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-3-andrej.utz%40st.oth-regensburg.de.
