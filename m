Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU4S3D5AKGQELREPJWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46D25F7C5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:03 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id m9sf875340lfr.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474003; cv=pass;
        d=google.com; s=arc-20160816;
        b=H70ZonP5lh4lAUqXj8L/3LYAhr5IauyBEtcvjPuNV2AcqWV+RnTWMJAfhU7xd3ZZo3
         sl0017qifM8oDTwLGW1VMGvIj3VVTp6bCljh8eQIeUa60V0mweT45k2a5Ial5+CzOhKG
         KbdNlye2I5TWupkReqptvUMSva3P4ekXStA7hx/htlCGfc/I58e6UGgBwkgiSJrpiihX
         WrGBQq2pILk3psw3XFNARC+GK0X0Mu9h+yOERQ5jftlqJ/EIpBj0NYVCvZkBOGHibKTK
         ASUUqEZpsGpBH0kDr0q83pPRmpxZueWqpu5KkKgR+XwO73TaqTNa1KhL+D1Cvp2AkaN+
         kAPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=hlqVKQgSPppxUwYiaptU61P5CyswINHkNZdcFY5QoWE=;
        b=i5M6LTQWmzcTmK6Fs0ko2c8BfkgpiaH74uayCCioqPCpdwR9ykHAyC76dWitA7cJTp
         Y6bxWqY53csqNz50rTLiuvfwx26YmpRQ6ubD5hLmU/M7XKDmprGoOtGxrZjVth5eCOmz
         /DRerlZAep/Z3YIroXYULf0vS1IQCL+Z7p8gwN6RtP0HkEXUsAvl+dYvONjE/IhN4qas
         K3XT+bwMcfdLWxEaeJb4o3Bn+x+XYoNSuWKxe/8cIQ9ASzduQUAboJ247L2YcuGxbXv6
         0DAyRYbwrASDfAMcqrnRjc+0JCkqXZHxFBtNxbWo3aebleo+OkiGKrSDctee9fI6DCWI
         D9JQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hlqVKQgSPppxUwYiaptU61P5CyswINHkNZdcFY5QoWE=;
        b=NxtQ3Lc0uP5rK2x1hv3PYWvfqRsS9bd2jIeyd461BrCkGKhoF0DHnw3AaOOxIgve97
         XfTOxQe2MPDRL16JPNYiaxGxNJFdOrdmNmNZLmI1KW1zL0ScqFTxrDCt907b2obPz7F9
         dbyz0wZChMHS1Vt8OXlY365WVhFCXK+fwKCu+IxgDtWW7O9sYWTroAKr1kB+ju3Jihy1
         XtJcYlBFQHiTNpKnXfgk/TFeVGdGjMEnfmtDXrrC6LSx20tpmpwqJBeBLUHgOSp6oteK
         ErC1fs9JmUz3ba5yAlI2kIlSdVTDWSn5yu73NG1h/BmWEcHHNAosKPD+hp48xR17ZORC
         4Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hlqVKQgSPppxUwYiaptU61P5CyswINHkNZdcFY5QoWE=;
        b=M2ouRCvX+XfBn4rBVOEmyXVRwKOKfbzZxAXUXCbqkM8X903f0vyeJ+ckbzB+naDQ/X
         4SdDhACaKuhtonpmCfMkfk+ertNI9HT+t1c6Ct83inuhHqRRz0sKmPFTNPnvlvcWBlls
         LYVKJnFZ0WaEMKrHrltgu5Q8m9b60uBALei+npulq/wdtrdEo3m3Nlv2vT0LnFyjb2/p
         fZ8l7CFjVRoC7l4PIXsXpWCOV/wyF5utvk7fqU5jxxx4rzSDy+2t9XRZ+kG/GWVyrw9E
         9mKxnVcBWmOeP+pFFMciMNaqdmt9GEJWRwJPSZuB4kkTEt29CJBHCCnuXBMkUhkEipVr
         HgCQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jXho23U+giXGAoUphnkhYe3B8F0RAsfV599EqDxjBoyJsej0u
	BDUyc2n9xG+a9Pkhsm8hTxg=
X-Google-Smtp-Source: ABdhPJyvgQQsIWyUxsgrF6rx6PzoPG4nRfb2uxKlyf/n/Vz0Ou11lxTy9upnRhG52u1TZMYrODu7TA==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr119510ljn.458.1599474003379;
        Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6e4d:: with SMTP id q13ls1641377lfk.1.gmail; Mon, 07 Sep
 2020 03:20:02 -0700 (PDT)
X-Received: by 2002:ac2:4c31:: with SMTP id u17mr9875925lfq.1.1599474002398;
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474002; cv=none;
        d=google.com; s=arc-20160816;
        b=vJcTdyUA/qW/bhi/MgRlS3Lo0Q05iIsaXKZQ2RzYRyl33yN6Blv6sxS3XdbfNunZl2
         RITpGbRAO7aMu3v5StYs9Gh8XpM9BKM6NO77IUANu7ChRGrdmP417gku/Qi2tYzq6f8i
         XJ1rrDXn1C21X3nzqTOh+iuVT/RrVrwDHKcEYxLgHKh6xMZFHDhXOnBeTqQyA9OlBr10
         9iOemAWKNGiFtptS0lUznNf1ethHXRVUqb5SI+nEms8xXGHZQTSB3qI8E7DJP7M4Gjsm
         HPM05gDA8jaoPEOpTm/7AGvkDfvc2/WLvjhpwAbDAgV1G/ZGtHC46t4VHbThlcSaLQ6E
         texg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=mZB2VqEi+e6xWtTZSLMEIJ9NmT2NUwqoYfaexjGzFzs=;
        b=viRxpEGs3+3Nmc1xs2tMlDmux2YXDm3vpgBeW8br1ijSg81D7TJs+pOvle2OI+hl6e
         kwHiry2Eig3aGLilMt77LxHS30P3KTXSiHDQC3rYcAf91gzsITesljATI5V8VyHWN1AB
         ITxXyIgUdCSzE6MqsuAGSOrunRqM4rPxye7Ie9A2DhCMdn2HdEnhi2N/ij/+63HHRcIQ
         +tkg6dND0ZKKV/1jLT75UX6Z9QpyzRHstbl2KPtqC0DdbWnrlwBsLXkIXQoLpbDitHWm
         P40v5L/IiNol7VvOf/owt6JjnRNeV/3dyN49PPexbLEgNGIyQjlnDUhWZZYIoShafmEf
         DIMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 14si405089lfq.5.2020.09.07.03.20.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 087AK1N8008233
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2G024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 5/8] pyjailhouse: sysfs_parser: Return true size from IORegion
Date: Mon,  7 Sep 2020 12:19:56 +0200
Message-Id: <2403bc4d3d0aac83ff0732ed24ce4473744f1322.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
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

Avoid having to override the size method in PortRegion and rather do the
correct calculation in IORegion already. This does not affect the
rounding in MemRegion.size.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 29c58b16..7c93b58e 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -910,7 +910,7 @@ class IORegion(object):
         return self.typestr
 
     def size(self):
-        return int(self.stop - self.start)
+        return int(self.stop - self.start + 1)
 
     def start_str(self):
         # This method is used in root-cell-config.c.tmpl
@@ -959,9 +959,6 @@ class PortRegion(IORegion):
         return 'Port I/O: %04x-%04x : %s' % \
             (self.start, self.stop, super(PortRegion, self).__str__())
 
-    def size(self):
-        return super(PortRegion, self).size() + 1
-
 
 class IOAPIC:
     def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2403bc4d3d0aac83ff0732ed24ce4473744f1322.1599473999.git.jan.kiszka%40siemens.com.
