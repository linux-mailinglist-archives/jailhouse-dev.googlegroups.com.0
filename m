Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKUZ2D2AKGQEF5B5RIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1A1A633C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:35 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id r11sf5225054wrx.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760875; cv=pass;
        d=google.com; s=arc-20160816;
        b=MfvQZnZ66Xw2X5HVA8dKojvx4yFHuHs4/eL+ghaW1Y/q+p5J55FZUdA0R880XLQVV5
         kcAYD5rq34/w753pv0aME5Mr79Ji1KZQaemo2SBy4RwQTYCRmaNlPRhAailYqu4cLQee
         q5TBDGE/iy/oK2P6OEjXDohDklG0wGi2SdpjfqvPp5zleDJGml33tc0h3vym6dmk6eNS
         9UY4iLIRwULnM+rlAkSZqcZNAtrMFeMezK35HO6fVrPR34+tgDvuVgoZavhz/0mg1m8f
         qKTV8BXSE6AVw8qHG3MAYnPi5HJHww25x9UXyV5zuci4QFXSdQQcB3a0nz/5FCXiHcCT
         Pptw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=sCj3If1QojCRuy2MLnKeJ3G/Zv0fNctXsRKA/BXVdTQ=;
        b=c7bWRpuEkGSRlfaKTjTHyaKAeFHrPZ13T50RPnvd3IglevZqdZjCg5V/WOZkqSdNPB
         FyJ/F3HoG5VjdQMvjl07/qK0nUPHnYiLoaACbwBUtk2wg3T2vhsyCBPFFlDXvNrkByAS
         LbDpdgKdVNTSuCEmrwUwkWumsx33SrTOvXtSVCay1eBMALnkd7Oyc1zoItDaf/bNykXr
         JFGY/oyLl4lna6/i+6eJRLgM2lK5ZpV5Sm7yUpxNuKBNMsonpt6t01tYz8XrA4T8zl1p
         qyEFVc7088LAxYhtO7IBxpVx/dA5rE7LWZDrAgmpM+sjY9Ty1m2ukWSPcOjobwSwNpmb
         8G6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=a89tmte5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sCj3If1QojCRuy2MLnKeJ3G/Zv0fNctXsRKA/BXVdTQ=;
        b=tIq1W8SAoL2ZFZ3dEjVL//YiUbz3E77ABhsn3qvsMLe2o3Cia4D2PBWfoXQW8UXF5u
         JAGuiSKiSlWSRm0+6kv/5Gz46B0fRuJveX5UD40vC6WEBazkTYM1YmFAtCnb28MSQJ1i
         rD7cZVUm0xmhPdZUICQIB1efZyoAXcbXIK4ShUpF8Mqc/i6RLrn0cjV68ZKYjJLfV/Ny
         5DyXc0bRE3hHEiJ8jqmOPTn+pf8ZvQwvqIib3DL0sNIGYfoqu50NSJkUB63HjiM1LJRP
         zfm6hGUKepZ/4q1maVcFWLqMJu7hsaVqAvPFxI/3BIxygZa3hGen2OE4jsBUYkYIy1RU
         RTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sCj3If1QojCRuy2MLnKeJ3G/Zv0fNctXsRKA/BXVdTQ=;
        b=L0Ybii/HlX7nFRQE535iI2r0+dH058hEvCJQFmKVzE4WEke4tJfyY1+XkQ1VSbP/BC
         2O0WZbWimbLN4yWWCEgfIYeX454F5ZuJ4CeuqEzPNFfVvntvw1LtNQqyCqMrnBgTp+QD
         bIcUZI1OzV7P1Mf9CBwHraUqJt7wzmpkJUrzwQKZwWcIK58W2BGPz/rPE1CJzrXShpxx
         b/SNKUxgCEKQ++L0W/omdvNx60jsYJ4TEwmIpcKBoInZQ1HyEV03KZkNHqAjohfIHVqq
         rpAV7ZWZ8jDylshspUFp+4dzqB7K+O/oAby5SZnzsKDQzpHwjSH4aMgc20wf1RW8KxNS
         zvrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaZPW0ll76effE+JXnCPWh/oWr9r5wPVY1QMhZ2czlFrMmjBCpg
	HDJUA32f9YmknrhVvXbOSoo=
X-Google-Smtp-Source: APiQypKXol8H1qyRcL7DXA3YpARjAmodrBqnTQTaGGrDYYbpd5/ZEoFEhsbfqT9dhMxNL8UrAYtVfw==
X-Received: by 2002:adf:9564:: with SMTP id 91mr17792826wrs.246.1586760875086;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5181:: with SMTP id k1ls6734577wrv.5.gmail; Sun, 12 Apr
 2020 23:54:34 -0700 (PDT)
X-Received: by 2002:a5d:6645:: with SMTP id f5mr18143041wrw.280.1586760874584;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760874; cv=none;
        d=google.com; s=arc-20160816;
        b=uOvXoma8ur0c50/szhfblLRkQe4VesMLDUAHQc1TT99iG2qABR4EZbcbpsGdXSqm7D
         AwAYhoz610Zs3qJfGKeHHqXPzrrjmhrJryXVm+n13Ptc8VeLWRah6GzyijCuRNqyPm0H
         to3kARWzScEttwrNvitVFuFmi069Quc/vrzm5Wb4KcDnkTQkz/9kkYNq7rIg8aUnoI+/
         tHxTWul5G/OGf17gpR8Xe+yN350EhXhQTRVmHfSzCuSNJPaHFMNHfE4gg4Uy0NG0s/Rj
         KVtunewOg/UMUzZrWX5YXg3b1qkReU2SnsGrzxyUW5Xy4/8KXEVYiUtk74XzEcq8SbDp
         Bfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=EEOA6Q95g8n+T1OAWrSHP9esgbOeKCHMhmSVnSIZrNc=;
        b=zIOKbnIo8hMFiS5xSw99dcTOs6lhx+hjPkCC8e6qPiB05gr/J0Xc2y6qzZVs4qmZHu
         GvLj0KfDgswGenL+XMpL+5W87Xin7q3czbtcaaF2cJDgd6NKoGg3QDMfSrKMSbL7BHmA
         ql0cK/LvUeVvsJ2yj8dyZW1j5jep+PFp6hTOMYGdH7ZUV80hFWjyW6tAJzgT7KYOlrir
         Wkg7I1RKIMVFI/TYc720GDmegsc+jMWOrmEa3bSggnjCfaaKdljbice6zTKUQS4PIl5Y
         D0o2HD1AGxGoJuGpB3xmsFx5AvxyXdVlVpGuQ5mAgW9AsneMgqsKYkmwDU9bwvrrtywh
         YigQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=a89tmte5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id g70si686848wmg.1.2020.04.12.23.54.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lk8ko-1irZJ20ZnW-00cC2y for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:34 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 05/13] rpi-firmware*: Add some missing license headers
Date: Mon, 13 Apr 2020 08:53:47 +0200
Message-Id: <f0dbdd499f544000c5e3ad57e5897defb9efedb0.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:9sEoCw5oGssh7L8kqp3XI3CAni8qDRq8LvbMhmrAnzUQHyKKE6B
 NHeouqH1kLPeRi7QL10q7jV4gI7H0oU4iAEQRrOepkp+lCZLaGbQM6Ir5sTW44GKPFP4B75
 2yl/Db6eHulMDiEnWXeFELuARO6l10vxtPIFxsQN0F2DLPY7/kiNmMfPt5RUeWGnoD2YQwl
 sYs9809Mja8rj/aWt/Tug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vvd1vODzOaY=:zGvWqcu+w2Ji3ualOkzdyc
 /SXuXsQ0qVL5utokSDTr5Cj5SjyD4R9l/r0wqKbLC3En/zfkbbSluENXuusQ1RnnkHLlJmZTD
 kV6PFd0aImgMIUyMf294Zij7FRiIH4iNerYgxZ271jj5Yjth6fqcO1XcC8N2OVJHP0NHZZSIZ
 FaC3S2tEKbc5U1lsa5VWVQMSRsixsxwFC9UxQ0huePI6RiO2Y3XOF8sVXNeP53sX7T7bOYgFM
 jcxbLt+sBPFoZc/OzTGSpRFgme6TFB+1ceCcHM+8FNf9byKgBlnZwnjukm9Clsbl2SNzHF7F9
 s9H/u3w/xJRx7bHh8Iqw5uB0+qa2Vs6rjGDe6BVZhMsuN001nckWblEYyTHXRoQgxeYVZL7Ga
 ijmb8gzahmdwOfURbkO2HEuGKJ5AmK7KT/o8n6mdum65uonjLl/jHEJ+3QkFIcVcW93EhhFA9
 BWDdtrtyVyzrEb0WHJEgf+SDKcy8RvG2PbWX/W5LTP2PxWk4Zm/n4qHNHJIPw1g2jnas6cgNm
 6T2DbnAcEWoGkxv4jChmx/KsYxCC2Dy/m/e2Oc+T2DvyMqOV1+zSHKbzr/PTNAe1JgezE5x6g
 SN0HLFRzARCvysVvJv07Xp5Us3dDC7RTikILHeZo2ZbrCNN49pd6/Sh7zNjjutvncNPcFUgRj
 oAMcguWfWMxfiHwJkkT57jgOw34Qnvdw5LSbyzPPHQSTF2IpsRmvQQ6FGmVFk5ZvhDSiePRHJ
 ds0CJbx62e3MWSy2VRweAheJEtg2DwEtv/vKPRcG0mUlUXzf2iocODYifwOkLb25zHfa+/yL8
 DpMxVosWrtpolBfrnxwAwWi0oa2Pgc4c360utyAt/+cpXmdKW8OYspXWIxTajHzjxXvoAmoBa
 CTLtRFSR1iBoWXio/+3wn0iu9PEORyUV/cb6EErrdVWCsiYjChYaoJZtCPT7AOaSmfElFF15i
 D6nh8fNp/ecMq5ila29hz3QbdyhDnm41REyo/zqcgj+4ztgmuSdkzlW/pTeXiPYA7ixDZU4Kv
 k8NqYq8/MQkUft6Cn9kQVAxm7arz+3hyHvspdFvFeH5pqxDd/cKV5bRGlVYfcwRgZqZwcUKEd
 41MD3AHXzJ4P7taUeobdIU5I5BjiPN7Aoq5ADHUNyXu+Jrpm8+8mRKiWXKZmHqCXRRVoWp/xs
 qSZsvkLFHDch/fuUYQBUZ5QsWpP5a/4yxQzGAZmc2vRJRA3FjRUzGRm7pAGteEM+n/sm3AjKN
 shKBtLL4J3P3Givyw
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=a89tmte5;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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
 recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb | 11 +++++++++++
 recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb          | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
index 020d63d..31fd19b 100644
--- a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
+++ b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
@@ -1,3 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
 inherit dpkg-raw

 SRC_URI = "https://github.com/RPi-Distro/firmware-nonfree/archive/${SRCREV}.tar.gz;downloadfilename=firmware-${SRCREV}.tar.gz"
diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
index f6d338c..657ddd7 100644
--- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
@@ -1,3 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
 inherit dpkg-raw

 SRC_URI = " \
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f0dbdd499f544000c5e3ad57e5897defb9efedb0.1586760835.git.jan.kiszka%40web.de.
