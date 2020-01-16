Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7YQDYQKGQEJH4YGQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97413D802
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:52 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id s25sf4993053ljm.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=tbB37dtDYmpW/IVPfBy135z/2mnMAUkIOFj8qUKMz6M4JzIDsCWtOL5QUyTJCSlZOB
         z7NpZHuLaBcF/wUFXXke9T54N7J3lqwkJJWSzxOqbI3OFOh4xc3f5SGclBE1xh5A9sW4
         yL/gyfc1zXdNQ2tP2PkRZVEvNMJdIM3z0Y+Q9+0ozkyOuiVOIf4Ob4DE1NmYvTIfCoXE
         z8U+Q15e3Pn06kqnycJuDnukYhf1IqGBaGVzAwS5amqrIbJMqtWKo/GFbv+2g2QWxn2k
         L3HWCNGWma6+/PQ9lEQG0o6oVvw5gjEejpQvkT80V4jfFZh51YDLik67SKfTGCTE4sY+
         rz4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=tLf9w9hEi4xxn1M8nvMxadxSZZhbxfykrjk1gvnNZmM=;
        b=t9VxFnF0BfNpxbhHtk82S981VY8dUAOVOxFk7L7r8WKV67N62eVtBH6iXFktgbGa03
         C8yk/1uyO0+ADaUpgTtBkFocfBpPL9ROclYI3y3jGtnpPFvzK3/PkiDR3uAPFN/kdxef
         /p6A226/AqiZSXr47N16DZW8F40V7zMQT1ZNhoRIK7P1HktHP5hqfSiRCDTMSbz+X7E8
         p72EfkRf5GAZLpKgwJDrBMmEADLGdzLnLk+guHBr8i1uZfL6kQmGTOvWNxf4e+jht/Ds
         9GMFVzQerH+e8Faq4eIbNNjykWZ88zNZOPz0f8rbmHthyd4i3SJOChZv44mbAM/13NKX
         X/WQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tLf9w9hEi4xxn1M8nvMxadxSZZhbxfykrjk1gvnNZmM=;
        b=mguo8h58+5pbZVPq7EKHKGe4n8KOCeTMH29HhOvZBkWpG+SNJ8+imy4X79wwBpk+/Q
         cLNlFo2d3AoyNSk5J3ui+Qs43I3kVvrt9F8XI5LjzJ8lX/C/cLbP4DR+XgGytkxO2z0v
         GR6TXTZYnJPO9hc+PWcGLK4Pd0mSnYhuM5QsnaYayPWhjEPdZ6HodaLCpXet5Fux5QG8
         gXTquqZIpoelhNa7N8YItI2d77T2wv98or2q4Xwozdki3lkgvgQf0JpRoXz9E6JXtDkh
         ziC0EzVncpYr5nhWi9+tpH8DD7YUgPhNPZLbd+ei+IDEjZwMfIPRDN/5gaYzTbw7MEXA
         mYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tLf9w9hEi4xxn1M8nvMxadxSZZhbxfykrjk1gvnNZmM=;
        b=bxC92Le5Fjptk8oTRCgQu+WTkJ5J1MSiyfnPHEBxQlr94vaAGDcDZnwgV6PevXat2E
         MlW3/RddYzk6jhIYMwr5K5rc3npAwTD2G73DvCr5/ViwSIVrkR+OQ9jnwfZYUpWiHd9M
         TgX0iRlyfscec9Sus1UCkcx6ngzc8WFqhHR6UjfZ8SbbPOSA248aleeadGYkk3m0hETg
         iiVVNjGASerW77cf7Se52cb/F3KUdSrMOAeVksu6s6/kY8UDjn/NeZD6JjRdf/mvSbxE
         X0AVh+JVToMn682YVAVrUgK97XQMLmkqZuwabA9LqN+PPhXRJuUFrP20JDGvoFDYIz5Y
         S7yQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUK7pUpiYPRorMBwIgXRHeDYXOxkeaU6Z9yAkIGc095rhSJTejc
	aFTwR+Vra3sXzANdujvhBAk=
X-Google-Smtp-Source: APXvYqwWNSJPkliESyBWsJBIh5O9Cfy4gzGkFbE+YGoGldFoNybnLfjH4N8i1KHzg9p7cWwg1BfOdQ==
X-Received: by 2002:ac2:51de:: with SMTP id u30mr2122202lfm.69.1579170891699;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:51c:: with SMTP id o28ls2095278lfb.4.gmail; Thu, 16
 Jan 2020 02:34:50 -0800 (PST)
X-Received: by 2002:ac2:53a8:: with SMTP id j8mr2068774lfh.28.1579170890937;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=dSPWIP0j3+ji/hBCLjlRrAEgZYpSqrUFOLSTc3ixUH5VTdNMcAcNmozu4AsYbE2vca
         DdeatoUxmzX1DL7VfbeMHunUkQHWTw2Ase/k3RGM4/YebnqRt9AI/+zDcph5UDcGgk4d
         FbTNE+w706rC9t5/8iWohpJHOLYGFGsPLvBBH3v1/FcgDuDgsOLAzvK2KJN47PRSVVuT
         b1ZHmfzBLAtyEC7fx7H9uxsbx/XeOtwAyutrBWo59255hqQ87f1LT4Eq7+KoltSrP718
         DBUe/BAmfjO8Wl5j5DqH+neOlCaBhHMlvqnNbXvDX4ahVm4I/K00UExr1iKEobhMHdwg
         94bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4ecSfwMuZDjIvSnK9/nP541pzfMHR1hZj8FdTslrei4=;
        b=DJE3WoxrziTx54DULPWa9e30ZB4w4J0KHFCWe3azGg/Yy/X1aqJq2EkSNJQsBoKnUC
         M4D9n6nGRgSkS/yQIkHhomklzmBVLj4sY+Pvmj2J86u0k0QIvySbbQRvmyHNim2c5mOA
         rfP9dyyo6VKGfY17N5cbBN+1OvFE37ySHeDTQ+JozfwCv+7RJjTQdNnBMBrTlf1orujp
         hb+jafXt9GYK6R/fwAFq919qi0E0BejjkFSlkx+1uAm6DjgL7JC3YMA6i24wLtBdsrHJ
         t8Z453U3cAiQosVZly3D4+s6mygVMDGgjU/au69RitWOYm5c+KuX5njg+aQYX0y0mvI3
         GW0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z16si818401ljk.0.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYoRc032084
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQP031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 15/18] rpi-firmware-brcm80211: Pull firmware blobs for WiFi on RPi 4
Date: Thu, 16 Jan 2020 11:34:44 +0100
Message-Id: <176e304cb0fa8e650011e03b2595f99a070497d1.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

These needs to be installed at the right place on the target rootfs so
that the driver starts to work.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb

diff --git a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
new file mode 100644
index 0000000..020d63d
--- /dev/null
+++ b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
@@ -0,0 +1,13 @@
+inherit dpkg-raw
+
+SRC_URI = "https://github.com/RPi-Distro/firmware-nonfree/archive/${SRCREV}.tar.gz;downloadfilename=firmware-${SRCREV}.tar.gz"
+SRCREV = "00daf85ffa373ecce7836df7543c6ebe4cf43639"
+SRC_URI[sha256sum] = "26e6e4aace9c9d1e9b9b1447f57ebd743dc15f3a337deac9e77d964885fcb3b3"
+
+do_install() {
+    cd ${WORKDIR}/firmware-nonfree-${SRCREV}/brcm
+    install -v -d ${D}/lib/firmware/brcm/
+    install -v -m 644 brcmfmac43430-sdio.txt ${D}/lib/firmware/brcm/
+    install -v -m 644 brcmfmac43455-sdio.clm_blob ${D}/lib/firmware/brcm/
+    install -v -m 644 brcmfmac43455-sdio.txt ${D}/lib/firmware/brcm/
+}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/176e304cb0fa8e650011e03b2595f99a070497d1.1579170887.git.jan.kiszka%40siemens.com.
