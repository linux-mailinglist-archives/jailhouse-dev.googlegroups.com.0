Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7B66BQMGQEAXFHBYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B58364CCB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:36 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id o14-20020a5d474e0000b029010298882dadsf9648115wrs.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866396; cv=pass;
        d=google.com; s=arc-20160816;
        b=r2QAskhPZ110nIEwdk1XLAbcqGXw13GW9uIQtvxP1FX/qj6yS7yC6MVLo1TpReYhjx
         76FGNAdRJAKps7/9RLcnN/tsyo2xwz2sgvKJcJU/PndLzIM2qrg+0AZQkO73U/T2HlIG
         bL92O/dX/AqrQr5tH3fTvhOTh4PQRjPjGeKPS389CMYuwn9PHJaej6J+N6bO8zSwlT7i
         XyF4aqavKOAZrCiTwGk70iI2ZsSaGHvwGD1w2412syqVJXm6pvC6IXsFdCkAKtM7FzyN
         g+Z/Bh6KlauyQF3+5NFQQ16M57sQOHeu8Gu+06TYE0I98ua/mW0CIdDcOhtqgiBd3rFS
         1Wdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=NADVkyz/sL70wVYjQ5bnrd39fEVOerAveZVK02lyY5o=;
        b=migM8bb9CEqdERG1apjZwmlBYAn5QN4idmh7lsOUVmOnVXXlgjU+/k41lbSIvpHJyK
         ks35SSAomWP8pDWEFOFmzZrz7WjLv8Mpnhxj6esqR72RCIkmNwGwF7p4eX4uM+qGF3d3
         OaILul7KNIdkUx0c1Jm58ahHsedmPdhyFu29zl9PjImknpfa8B9LCcDC8JmcdGLWFqUB
         vVA91U9vlYJWHXkukuWhpPfazeUjT/OmwaRaQsFVPZ9GNtpQWzy1t5KT65OSh5FOMNCu
         N0gvLe63bVl7Ny5pIwK/2LvL0zMMOZiwGUbyDieCn5LZR2wfP7BAF59jWNWu4sGpvL8E
         CN9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NADVkyz/sL70wVYjQ5bnrd39fEVOerAveZVK02lyY5o=;
        b=UNgneBi2KadkolYhlJzHUMoqkc5Siwz4PKRxhnbJNG1Z/4emLXaCzsPqwFREatb9ww
         kaU/+cFa94E5ktc4rqciwi6DCkmSEC2DTHSMp7tF1LkfpqK7oG7GrZ+NPGOFLzmtltoz
         5tEvx1K5REkOhos7qJ64gvsQz3c8nGnApK9rJhxISvd7m+wlI8qNUmMQs+UJ5nj60Dp/
         id1XNE5lSHA5dAnRDOV+IcKcEv2qZrbNC5/U8S7UWpJoDMFN6N+l/DXp+cjeMkVgS7NX
         Jv8QJOAAWIZ15Vech2s1ksBfKBrQwwIqDEzjW3/1rcSSt4dpZQIis1pZWzdELvN0wZCf
         GISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NADVkyz/sL70wVYjQ5bnrd39fEVOerAveZVK02lyY5o=;
        b=sVZWnM7AoRsFz9Hi/wwuV6oyEd+NdwBlmO6LE9zJeTpt5w1yo7O2Yb1sNE4LsMS4jO
         0xamlNEzhX69sfwzeoj3VtQyj6bU0MLBNRg5srdfpaP48HBrlIaawQemKHtdGkXD5oGm
         Aq9KgfpY1FO2DqS1RkkJN/ucjapFXk111VHA7rJDTbl3wm/zLkkkBtBzVAGSDapDe09K
         9yv89ot1sOA90MkwKiifJP6gxrRztewGvSP3XrBazJzLzU4MaNZVuAgrjazbFFbocgdK
         0fmwdwOpT8/fh9ZNP7wmuLJfq3nlp/UqwMSIUYrvqbh3c4npGQDHzrifneDRsCBMUD33
         7BRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533819wDnzntWBG9sH8diB+kTArInoBeQe4AhC1CbxQ7ITjFQtEv
	yFXFvh673fjblH495VRMJQI=
X-Google-Smtp-Source: ABdhPJzjYMAYEozBDl7qnZ221FQ1Tas7LPDBePmYKvLmlixz9XEsdpWy3a4608aqC7IbaJFKLeResA==
X-Received: by 2002:adf:e647:: with SMTP id b7mr16204528wrn.43.1618866396178;
        Mon, 19 Apr 2021 14:06:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e5:: with SMTP id g5ls9314817wrd.1.gmail; Mon, 19 Apr
 2021 14:06:35 -0700 (PDT)
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr16394740wrn.128.1618866395382;
        Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866395; cv=none;
        d=google.com; s=arc-20160816;
        b=A4njG2QquxhM+6qucXiouwepslM8rroENmPucqQ+GTWsL+q/nMl/sqNtYw2CyGzRLe
         hEZTKPL9cmRagl9TEy/P44PZwLBdh2Ywju7SHwocOGhIbTj3gMuV8w0A4K5VtOMfqWfA
         c57aXoe/UO+W/bgQxtD/b7MGS0Vk6jpBm/eeCbBS6K3kvnoOYDpArjfXg2c8mSkrL6yx
         i7p+kN0i7Oc1s3HMCiSAGnN/mmaHRx1LPrtxmhcvvCGvQmqsBXBAmYItqOfwsukg9QqS
         nOslPvaehXMfA6b3wAlanSeRDo6uK5hIyrkuJ5VogZK/XZgE6t0CPjnzwIq+78AiZW87
         SzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=H0glV7ErgutAv4c1iJa5vMoafRV7bYwMO2GShqjkTxE=;
        b=ruzpaW2DEQo5vpYZYYsLLmWDhbiMmBQLHx+Jdr6ivWLu7/g2DpZ4tj2uYz61eYXylA
         zieOuwlp4cJotVfuUJcNJ/DB1fiBcU1a6Gin0ajj8/EsnZ5SmGaAGNYrEo8pzclTNyLn
         e4V92DDmi7NO/xg3ZX7if9JN9ODk+ae3eoKT1m7FajE4HWndXLfWfhrIzXijKx1L/hAL
         B6y5vF/VUsmMK4lqVSKFijZjdLmM0VBintda38zyKvziP3UNQ10Zhg40dHYz3aBHmMse
         yvlmn5rcQytf0Or4C4B/rvxcOni2zXkPSEtZsepIWJLGjjiSxq7L7oISF2k2H672SZji
         xD8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l2si31910wmq.0.2021.04.19.14.06.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6Zrk022137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:35 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpn015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:34 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 20/20] rpi-firmware-brcm80211: Update to latest revision 1:20190114-1+rpt10
Date: Mon, 19 Apr 2021 23:06:29 +0200
Message-Id: <e1da5d4b3206fe723ba7b24eb9172463f910dcc6.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
index 31fd19b..602d8d7 100644
--- a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
+++ b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
@@ -12,8 +12,8 @@
 inherit dpkg-raw
 
 SRC_URI = "https://github.com/RPi-Distro/firmware-nonfree/archive/${SRCREV}.tar.gz;downloadfilename=firmware-${SRCREV}.tar.gz"
-SRCREV = "00daf85ffa373ecce7836df7543c6ebe4cf43639"
-SRC_URI[sha256sum] = "26e6e4aace9c9d1e9b9b1447f57ebd743dc15f3a337deac9e77d964885fcb3b3"
+SRCREV = "b66ab26cebff689d0d3257f56912b9bb03c20567"
+SRC_URI[sha256sum] = "033a21d19fbdc7617b8c5b58d4be5951e29be5be787a45875b615f4d4dcf3f5b"
 
 do_install() {
     cd ${WORKDIR}/firmware-nonfree-${SRCREV}/brcm
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e1da5d4b3206fe723ba7b24eb9172463f910dcc6.1618866389.git.jan.kiszka%40siemens.com.
