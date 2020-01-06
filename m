Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3WLZTYAKGQEPAMI5BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A0F1311ED
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:59 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id p2sf2781752wma.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313198; cv=pass;
        d=google.com; s=arc-20160816;
        b=kbp/wWuiuIpL7Nfl18CiE5BOkHT+LjOyLuDCBXYlksnvJDHdHQhXyt7jOZzldzjZ16
         bBi1nOkXqZ3PVfQum3ZLJO729jULn0JsiIeH87gbft3pQVphZMFdB/6uv0dtlD9SYf+x
         qeCzobUfeSNwaUwcHYrP+OTZFz+Na5Ptx/DaNjV8Dy/qsJUexXWxhPsx+rWkvyVu5nE8
         JNGcSC+7SjmdhIKCJbxMOS31jAmdqYHAMyjtHjjG1rK5Tc6xSylVSnoB0639+GD7e3PJ
         O6wobguHO9WUbs/UXJASC96OvVb2BniGSzSpdV9UIS2Wvwb2cHNX3NjesSdOq5H0OHj3
         IfxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=EouJ0Zcfx00DUcw0AkwZO1ZNrtm6uNI7FhoVrm982Wo=;
        b=XRFRhyb/vNUwHm40SSnuXTNT0N1CadG+iYPUsmlocRr1+sU66AjJPJ+GzICpqf4++U
         Et7DZ/9mAjVk10APwufv9cRqxU0soCrDv7QEyQlYtlcHR53al12LiHABH45Czbvj6SUZ
         3a1h1Oaby7q1tfVqexsRr7VcARFYsOvp/WgIfb3jNTlZdaFIspCUDngFgYy5/Q+sJht5
         ArmmUOL7WEtseRMZJJbJf23kVACuv2ieP7O6NagiKzaqqDmAquf+H+wpCXOMi5+JaIyH
         OfMnsnZZ9077gNq/M9X3CTpeTA9EXL2v1hPXPvmhyeS9k0sBiUQKVZLdyCpyGJDXdHOQ
         pWvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EouJ0Zcfx00DUcw0AkwZO1ZNrtm6uNI7FhoVrm982Wo=;
        b=ABU62hemceYtrD4nf4x/NjinsuOvydf+un+d9XuKjrRDW3AUkgDwx4RMiBh0lbTCF2
         /c3vOBSec9rzSpF2r2vTqNEcJQF5UVhoMWS6KU9GXwhjx8K1/k+/GMteQ33KacDfwX9K
         /qDXB520JoWSUMyqsWLdtmWx/PINX6wKg9MY8lc47U9/EW7Lw4d2tyGeUEBq+O3XQnkr
         muV6hV41gdtLVU6IQN2ofvqcBmveWv5lcp6xrU9XSXryl9SDrLCU6y+k/0Q6d8tL6WwT
         zEcbL9dF4J+tC2Z3fR3qOM+0d+VHEA3gTtGMxvJ2h1ruCA0BayuH5biWl+lpogTJOgdY
         lOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EouJ0Zcfx00DUcw0AkwZO1ZNrtm6uNI7FhoVrm982Wo=;
        b=hokQdJk8nadqE6VYXHMpBykgd625MEWmkWdfxaOmEB1GgbpopLQ/gS/iF2g/yOCaza
         xT6HN4gD1o8ymJPfMI20ruYAY2JXZPak4e/b5x8NqkptYOIADU3QYUo1Tti/AROQNB1Z
         3zbVuwOqAKsEnc4NfZjnpCHYleNeguewXeF1cbuP4cVc5Wmk4DZIzjiIBtwjyYGZa1OS
         2olktP7SRY0iqrbhQ9j8+/lE1AmTTdt1oGSm9NOqxLHRsNlDSmp1OVAZF3BGNsFivHMY
         nDcYgHAnF1I7lFLAbI7G97ogmbkkavPZ6LjUsVyMToS/Qa2xx2J6l/B9SYYRnV0hInuE
         /LIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUCzGAv15QqIOQ2e65z/kHvUh47lA02GJZtIsr6cRca0abTDGvp
	E8Qm1/l9H0jkTp5KGUuzV7U=
X-Google-Smtp-Source: APXvYqw38TIe5QpFB6f69Q6cTOuCp3+3xVBlEapcNBaa3G4yENKwtRwXKOqoq3pc8bjx/C0/p3DQ5A==
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr106473044wrs.20.1578313198673;
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls5256632wmg.0.canary-gmail; Mon,
 06 Jan 2020 04:19:57 -0800 (PST)
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr34025278wmi.152.1578313197947;
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313197; cv=none;
        d=google.com; s=arc-20160816;
        b=LptxVJJ5VymednuAx9IvH2MgV78klON934KTYhnQ1tb/yGb1Mq/cuWd/mrQR9V5q6D
         SUCit+Acid2Au+5fBR0beIFVCzJhQCqPPXW5LAWcmkEt+9W14tRmIVuadVWGjy+re71K
         i5q2m8fK+7EyRHsI4N5EIop4sa8aCFRglkR6awHIx9mHnvXPa1zrnR+ILvbiQVQDhzvZ
         6Nyc/9CrfeIbLipjGJfYunp7205WstsAm/sRQyqwktfskSm7Od7nz2vp89DRmpX2MVfm
         ih+K7lJYwMkIqP4n2xHIDQSO6Hb65oI+NKpe7ACIvzzUcrASJlBClhCAQDDilqiu4yxn
         I4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=9y/pSxru/jJRjuPoj53E9VOA2pH4P3HWroVG90Rl4U8=;
        b=apulgSO48N6l+Yw3sLDFQb0f3tCv3qNcIHSk9JrC5nDbhefcJRiYa64V03SUbXnXFG
         LljEIgiM/puqmB+94Sy6P9kzVv46y/ydJJWa3NFaNnakI9lq2OicTxoZ0acGa1k66DaU
         3Bax9wLRtYu+bIF5F+nwqXa6PSDFvnk/+4IYUybQ9oOkXqXOo0VJtx2Ypqgx4U1XRo6e
         8EN5vRWI42pUxqtikQs83464m8FVJ8fdz+NqoK7Z3WYMYx4HRKJMALC6diqQrrAo4EOw
         xmIxhs3JBncyo2hIIYDYngT/zuk0ShwbxdrxUxgY0cHxxFZEdrY9SGTOS0b9qWwG+Ssw
         royQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o139si842722wme.1.2020.01.06.04.19.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJvj7021007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:57 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEh029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:57 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/38] core: ivshmem: Reorganize MMIO registers
Date: Mon,  6 Jan 2020 13:17:50 +0100
Message-Id: <44e10eb60815a584e40df5d569038813150076e9.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 739b91b9..3f023b49 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -48,11 +48,11 @@
  */
 #define IVSHMEM_MSIX_SIZE		(0x10 * IVSHMEM_MSIX_VECTORS * 2)
 
-#define IVSHMEM_REG_INTX_CTRL	0
-#define IVSHMEM_REG_IVPOS	8
-#define IVSHMEM_REG_DBELL	12
-#define IVSHMEM_REG_LSTATE	16
-#define IVSHMEM_REG_RSTATE	20
+#define IVSHMEM_REG_IVPOS		0x00
+#define IVSHMEM_REG_INTX_CTRL		0x08
+#define IVSHMEM_REG_DOORBELL		0x0c
+#define IVSHMEM_REG_LSTATE		0x10
+#define IVSHMEM_REG_RSTATE		0x14
 
 struct ivshmem_data {
 	struct ivshmem_endpoint eps[2];
@@ -106,7 +106,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		/* read-only IVPosition */
 		mmio->value = ive->ivpos;
 		break;
-	case IVSHMEM_REG_DBELL:
+	case IVSHMEM_REG_DOORBELL:
 		if (mmio->is_write)
 			ivshmem_remote_interrupt(ive);
 		else
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/44e10eb60815a584e40df5d569038813150076e9.1578313099.git.jan.kiszka%40siemens.com.
