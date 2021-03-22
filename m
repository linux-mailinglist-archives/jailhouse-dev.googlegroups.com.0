Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBW7H4OBAMGQEEC5RVFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id DC59434502F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:31 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id d15sf41247ljl.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442331; cv=pass;
        d=google.com; s=arc-20160816;
        b=jyHxbJ4WBnrsKCYVY8FyF5x+m/Ene9EGTB171a/vOMgmHw+5uqBwfUQT/XBhe73E6c
         97wvjulfrrwmYyaqvYtQEUF/t5pRcW1Qg4t2yYPs1R8tW0OTeJy3V8VlwdiM09EyWbi0
         jUhOeW356LYc0OUFUSzd0kOlbymHS7oCXV/Dz4IAgaimuBRtg6p79cGRfsMVtMAGBqcc
         j4S2d4V1FjToZemndqsYk0r/8vUa6xThOule9sEklWz13Vl8RUyadNuQ4DpTg3QGne98
         7n8o6rB5QHxT086EMVSDXFfT93cjtQJg8SLm/ajbBAmz0kcRlTglE/AfIbviXfy32rWr
         st/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=u0dhEf5ZP0DnyQyHsyelpWspwSTswwAvqProtxjcNQM=;
        b=UJTqfhUfblW0SGM18Gb8i6Hsv75zeBao9x/rdtSEAGoGfjlsymKhC3tZNc3LC1Pgnr
         pRmzwppW0zjovocS301ax/t7HDygnuQrMe6S75zXNTzKB9ZLiv+p01w3wHB3Bz+QsWTq
         I86/dFxBHRwI1w+b5xNQbHlWIXzIX074NSOQtgu++Q0uxcsCqubmPwF9BhJfTeiID6WY
         5ScDCpmBMrmbDkvEo3L4LF4fLdFPM68jd/NH07w/IHeJTFcycZOT+SmaW2eNIpu5w+FM
         ebiCUD0iUTSw7LR7qORXPld8Jzax0uZj3leXP3tkV7xm4CcTWElNuOpcSQbHSaeCUrEC
         IiGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JiQk77qU;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u0dhEf5ZP0DnyQyHsyelpWspwSTswwAvqProtxjcNQM=;
        b=gNTKJm35OySgmIxIwslrWztTR7TnVPNtv/na3/dPdp1FONkCR3mpKbNIm61uBdSxxV
         vsoM3kxOJcYC5uU+kdy4SlCGzCymcvsOBQa3cOYKiZe/lRVt0JvAsrQk5BrTWOGgqOEA
         WYCwEo6cuhtZutLy2Bw0HS/yjSdUlhggM8dyQNnTYIKcbEOCiXRUUaaeLW9jTc2iVijC
         XOQgAXebVa7Y9kZrhT48NUPpetxpGN4fK8fwKssEBbgWFhz58448Wx5TTQ2a/jIcL9Gj
         GFukqSuBGGIjZaBc4W/lZ/dto0mkBvHms7ZiOl+MQ+hjwBPEkJqyZuw0ROuFJ8lJEG/t
         QP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u0dhEf5ZP0DnyQyHsyelpWspwSTswwAvqProtxjcNQM=;
        b=O2XwdBqA61Wt069I5H5Ilz40VcJxRJTo+/19ErKKdtKEQWinvNHmPGRNbV53B82Vas
         sCP5j4QQUc4fhX2jIZvvKNMhry6vJ1CoWITS4UPHBgTjUyuV4PunrD0R4R+Jfp/B5+X6
         8TL7hfQMRf0BhIYVY+RuBsGHZce5+rQYOia47cb1RMXMUSZez0lo2T6Gg6Ka8cG1WVLV
         mr4fFmqkKMjmEc9FClL9Z02VN6TglgAdWWIP0S5shQVLbRwGSPlHceDGX2gXcioLKarR
         Y2uab/8P55e2KB2wSZj2lRV0xMOYFzFMt1ovtMsj4Y45JGNN2Z7qWaMDrYjAsD13gwpK
         DNBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530lhv++0u9t5EJBPRr049ESV0aw204IXNeXJksHyDHAku0jwdlG
	q8dze+azYoGxVSKZV+Z4o6o=
X-Google-Smtp-Source: ABdhPJzuQflqzh959Yj+mheL87VrFpqwJVj1KvS8vThklaAaNoETI8F0ucGnhvsss2pKEg6aS1F3sA==
X-Received: by 2002:a19:7e97:: with SMTP id z145mr566977lfc.280.1616442331434;
        Mon, 22 Mar 2021 12:45:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a409:: with SMTP id p9ls2672320ljn.0.gmail; Mon, 22 Mar
 2021 12:45:30 -0700 (PDT)
X-Received: by 2002:a2e:965a:: with SMTP id z26mr704402ljh.10.1616442330430;
        Mon, 22 Mar 2021 12:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442330; cv=none;
        d=google.com; s=arc-20160816;
        b=w7fbH8HujBG46Sem75v3gow7jakx3Y4sXbj6/RTuNv9Dj3cOo+fX23D9eTTZ2kb86V
         gz0zqXClPvQsb7ZHaSlT6f/o1jMGgzLk374qxWOjLmrz6f1By9BA4arKp5XSI4S7n50Q
         fdfZIws+c5OSsW/QkUOnAEf5JvYv4DcPJPUAKv/LtsYke9qsISlEB4MIPztzcUU8xXNf
         y4SYawd+E1x6uSN8eNgqwTqcAhhrA1fmy6HNBWL9EYjGYLsFIm+8sJVmY2Pjz0oplfar
         mccE2ih0Zff8aa2DjfW/HYHsIwA0Ugih8OTZhZh26RHxss3Hp0vUCv1JFXf+WiTuN7Ng
         8N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iEAEPOuExdtshWjTj/O6qX9FMbEkEl6pzu0OccmJLaY=;
        b=aXhQtDpYrUAcBPxECGBgqkjFgyraSAHUYpb4hT6SKRAbTYoRU/F39hmsymPjP+QzJe
         G4vbhhZrYCfaiJJjyvtrDWfMuk/KgrqScrqrs16PVjg9bGwCnWGgWWxBR9YHw72L/xYT
         Yd2dCQBdunL8IFlvhDUZXLURhPbeznb8SHnvKqDK93JlMBGya4a52TFVixQgtg3JeYpC
         Bwko23fSzfqAH7UgjwWAEmjdcRyhjyFKOZyOd6d3n9H1As1QdxkRD83aSKOw9qHUmQlt
         ra6nXZm4zgIm1RdLAn//0KMxMAfcCbKFc2TQY9JPEVcF2/mWSych/kuEzntZhd9j5d9C
         0gLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=JiQk77qU;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id l11si130860lfg.13.2021.03.22.12.45.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jP6fDhzyXZ;
	Mon, 22 Mar 2021 20:45:29 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id rFVw1FfibqQx; Mon, 22 Mar 2021 20:45:29 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jP2X43zyVB;
	Mon, 22 Mar 2021 20:45:29 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 5/9] pyjailhouse: add support for colored regions
Date: Mon, 22 Mar 2021 20:45:03 +0100
Message-Id: <20210322194507.82643-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=JiQk77qU;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

From: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 pyjailhouse/config_parser.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index cad761a5..b612f98e 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -52,21 +52,23 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
 
 
 class MemRegion:
-    _REGION_FORMAT = 'QQQQ'
+    _REGION_FORMAT = 'QQQQQ'
     SIZE = struct.calcsize(_REGION_FORMAT)
 
     def __init__(self, region_struct):
         (self.phys_start,
          self.virt_start,
          self.size,
-         self.flags) = \
+         self.flags,
+		 self.colors) = \
             struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
 
     def __str__(self):
         return ("  phys_start: 0x%016x\n" % self.phys_start) + \
                ("  virt_start: 0x%016x\n" % self.virt_start) + \
                ("  size:       0x%016x\n" % self.size) + \
-               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags))
+               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags)) + \
+               ("  colors:     0x%016x\n" % self.size)
 
     def is_ram(self):
         return ((self.flags & (JAILHOUSE_MEM.READ |
@@ -84,6 +86,7 @@ class MemRegion:
     def is_comm_region(self):
         return (self.flags & JAILHOUSE_MEM.COMM_REGION) != 0
 
+	# TODO: add colored versions?
     def phys_address_in_region(self, address):
         return address >= self.phys_start and \
             address < (self.phys_start + self.size)
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-6-andrea.bastoni%40tum.de.
