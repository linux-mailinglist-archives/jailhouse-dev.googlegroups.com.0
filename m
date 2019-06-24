Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIG3YHUAKGQEMUQXIWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D350245
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:28:49 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id s14sf2036540ljd.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561357729; cv=pass;
        d=google.com; s=arc-20160816;
        b=Put+5CHmFExZ/WwUCd8BwgV0GToQ2TMspDxqecuz5DItsxBNxGXYT45BE1NwPk7hJb
         IH/7dlfDfn+bbxiX7jK7z6XUpjXWMaXKrp7qd6oIMex/wnQZeCIRQppZdESb9A0f8C3m
         vW+NbbnmjPLp4NYGjFhY1dHsQmddIx5CyEYCgoiTEl8ipec+zRaIleKW3AMwxZkw9NrY
         mJHzww1VBA4Imq/DE8WFU/IPT0x4T+8l5A7pfeMKgcYP46uMzugjOXSwORQ0LzM4YCc/
         +t79ATRa/iKoT90YWsgZom2WhOkztmGDycq5qT8PhJWDSIy8Knmi++XEwqPVMGubQA3g
         EPAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AHfYkE9x1etmQab1hCKL+F4ImqydsLPhqaC0N1JLz2E=;
        b=Gvhw6/6QpHPncihvDEqtunPjvfOJoeyI5ZPGgMtPgorTewNLDtlCoYlRffpZ4eQiUC
         YoT18T+rNd/6ixl0uSV0ZoBbI0aNemnT+kP7gEXSgI0vIGcYU0kFEEwdIKxov2eiUf81
         C9ADnWXa3veJ2rgl4X8DHzsCO1vXs5ua+YWBcNqRuYjsLtA45wYhBGSXgUOM72yar840
         jytyD7x4RxjU1dSlSkqlzd5ecITBRsiXpcKTOYMaNaboGd+apnVHKMkVrJaXaQZtuEtK
         pqWo9cT3/7IpfTQjFGhwaTGTjWOWFMWyX7YhaS3XiBlH01A+X3U8UWN/bVU/agtbaKDz
         OB5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AHfYkE9x1etmQab1hCKL+F4ImqydsLPhqaC0N1JLz2E=;
        b=FK9fllov0Qym6IaFzJEZ0kXht5WWHqViALKucY6LyhOvyIXCW/MEMNxlKHkaAu4B5A
         wJeEIm3TEL+gDQGf9GDIi3cjtgd/kA+E0/TOMwF1fNfTUVE6JBGlZUwrs6SVD0bPeKvd
         W1B1Uqbr6N38Av7Iz/BGIsetluL85sZsFhDJngAOz7KdeBz71/10G5xZ8hm86PaEWG2M
         7byl5ts9uAeEsUtVWiFIosnPI5CjLjItrsS7EitnzEbpOT4cNwtCLsJeCZQnAeQENyD0
         nm3cgZg52oAcerITi1OZtMsqxAZxXjg2okIYqi7i6b5QyRRqHfP+15Y2xuaKAb9kQiKf
         irUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AHfYkE9x1etmQab1hCKL+F4ImqydsLPhqaC0N1JLz2E=;
        b=Gy19MSwSZ0N57Bh9TAthjEP5VrFvK7SQpNG7YzyCfqP14wtVo0M9tofb7E5rdM+NaO
         I0Q86e53BuwimM2yYUGCYoiy+kvV05Ivm02kmCq9/+tQJ8Cf9ydlTDF7kKxHS8uFuv1F
         gbb00vSKolxXBUUhFd/ab5ztRZ/pNjzjFdqfyhnKQ0s7XqgT4CuuVH348dRLMtdFIDyu
         0snrCfzHsiiUBK+da2tzBYvM3yiBwOdXbcMxDLGzjBThDm7sy0zXYCuR1wOqpT6nbLrp
         L9E+e3AjejjHnmA3B2Qt6PTNm0Uaz/QGv053NMEzFQBl+emSFnFB8+sfaVMTz6Nxno9q
         TjWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8q7eEgLRe59VZqrJmjPgRfzWHzM4JXsdCsTo53W+eGXJd3zCZ
	K44oJiHCM1yfXK2zvsivXfM=
X-Google-Smtp-Source: APXvYqxSjJ0wxBjKabOcz1Oe0OgpEeKalMGQf0RQrDVW0ZukcPI5noCG4nySWeHd1AJKh6gdBqI1ig==
X-Received: by 2002:a19:c78b:: with SMTP id x133mr6265541lff.85.1561357729070;
        Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5dec:: with SMTP id z12ls933870lfq.4.gmail; Sun, 23 Jun
 2019 23:28:48 -0700 (PDT)
X-Received: by 2002:ac2:5310:: with SMTP id c16mr74163893lfh.119.1561357728444;
        Sun, 23 Jun 2019 23:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561357728; cv=none;
        d=google.com; s=arc-20160816;
        b=fl1jJw93bc+FnBr2qg39iNrx3DbzIfaJICiYQMrKPlwlsFF9zj8Du2Cboil9fMl4aS
         HHVULQxpvSCq3EwHnDyPhaX46ufBfksm/c9Wg+R09qWRkE3S3ILeoqHIO6HicEnpkpZ4
         hFvoEXD7vujiWZeBJCLDaHEvt5leJWc016kokYuIRExDQmFB0fuZZCDvakZqoMmfr34k
         6jcHdF6JsP0Ci7Wt0y1rDeGtYZpdbBhKL5b5nBkhJNQyFNaXZ0AkOTIFKCqVFZDQCxtr
         1RgQpMLzG8zu2zIJ7mV+c9KZDkHzO4+StgFVzhjoQpSO7aJ4lfyGzW1Gi34GvBdfxi8x
         3Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=HZAYve+UPhqKlb0cY2PKnZaWGgdqPZiDfaETyDGCtLI=;
        b=BkB2FIok+H7Hetu9ORIXq204ckuGNUvmR7dzoT4jpkCJ7YtrjQgKkVlFRB6DMHXd9L
         sUdeA8au/KLNmIH6DKKSpe7r4ehAE2VbBvMIcCV/jw94R1dVdcT3Z9bkFJ6BaeYXX+zw
         qpQ3OvOZphXfjRPF1RuQMVZ/sUTiQaimeRw86OpY4zXHq0AKyEce0Z6hXtkICdtyNCXz
         h9DKl04Y8bJ7PHErwTnhOH/Pfg9N/pcTMlmJ16X9kIpb6O9ehAgMiB1a/ATVwyEXofnW
         W1UGeTaPMEK7g7TnIGX/Yw/SQuTmFHHpMLzLTmJhQrZ0qD1e9hZ39n3UUIgKlhitNw3t
         nKyQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id e24si549190ljk.5.2019.06.23.23.28.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5O6Slt4026479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:47 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5O6SjUY030166
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:46 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/3] core, tools: Add msi_maskable flag to jailhouse_pci_device
Date: Mon, 24 Jun 2019 08:28:41 +0200
Message-Id: <ac81edf1aa7ed9f58e4ee5a5e1dca8ea00762143.1561357723.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Will be needed to avoid injecting interrupts from masked vectors.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 3 ++-
 pyjailhouse/sysfs_parser.py     | 2 ++
 tools/root-cell-config.c.tmpl   | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 5739f332..76c9e56f 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -168,7 +168,8 @@ struct jailhouse_pci_device {
 	__u16 caps_start;
 	__u16 num_caps;
 	__u8 num_msi_vectors;
-	__u8 msi_64bits;
+	__u8 msi_64bits:1;
+	__u8 msi_maskable:1;
 	__u16 num_msix_vectors;
 	__u16 msix_region_size;
 	__u64 msix_address;
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 3db61980..9555d07e 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -682,6 +682,7 @@ class PCIDevice:
         self.num_caps = len(caps)
         self.num_msi_vectors = 0
         self.msi_64bits = 0
+        self.msi_maskable = 0
         self.num_msix_vectors = 0
         self.msix_region_size = 0
         self.msix_address = 0
@@ -691,6 +692,7 @@ class PCIDevice:
                 if c.id == PCI_CAP_ID.MSI:
                     self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
                     self.msi_64bits = (msg_ctrl >> 7) & 1
+                    self.msi_maskable = (msg_ctrl >> 8) & 1
                 else:  # MSI-X
                     if c.msix_address != 0:
                         vectors = (msg_ctrl & 0x7ff) + 1
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b6ac8637..81d3a92b 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -183,6 +183,7 @@ struct {
 			.num_caps = ${d.num_caps},
 			.num_msi_vectors = ${d.num_msi_vectors},
 			.msi_64bits = ${d.msi_64bits},
+			.msi_maskable = ${d.msi_maskable},
 			.num_msix_vectors = ${d.num_msix_vectors},
 			.msix_region_size = ${hex(d.msix_region_size)},
 			.msix_address = ${hex(d.msix_address).strip('L')},
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ac81edf1aa7ed9f58e4ee5a5e1dca8ea00762143.1561357723.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
