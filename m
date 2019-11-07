Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR5DSHXAKGQEORCNB5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F13F358B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 18:17:59 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id l184sf1512978wmf.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 09:17:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573147079; cv=pass;
        d=google.com; s=arc-20160816;
        b=V765Om338praFBsHDkDbyEIADTWH4pYr+8CWhQhIbeSxrVwipT5xP45eLW95QDd6OY
         D+DZwiHpcilSiiJQIWYwuSa3lvNcg9zngpXpBufATF2rA7a3myR224woXDcefrPgYpUc
         WCA6qjUgWVrSxosXd0iz99O6rELGqrNu2VZvmUG9Zwvu5DfCQNGLXAGUl0CIRgjsfPp/
         t+IVbYba3+88bGpA777mFreXAK4f1Hy2UIXz/P6fSkOjU1pmYByc1Jx8UES/kaETuBr/
         33iTs6oT5ZlRurtaBuL3XX4pg420oMpdVzztYTJdKxzv1FSXWiaXzEWayMizgPvu2GUd
         MgGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=eJZXJQI2NFAxuuqevZB5XdXTMLgvzWMkEu9Y6dbgFUw=;
        b=Tf38IT9EzAGfZ2RuKjTXWtv20CXakZUmXnHMoTvm/8D64Vm7ZkbuSfaVKvefultqCV
         2xpjSlHPie1Wtyitgk3ySun4KpfDaMBeO1zyXsvqAjRn7GGjssyHRUeTUEHneJDl+LL9
         SzUjWe10zwLhFLSQHMsMhBQuuPI+POs2kvBW78hNXirBnDnNHiNEfxuM7vOBPuUx2SMn
         Lct6WVzj94J7jN2TOK0foSDo/D+UXIF19qOp+KTlDcTyUoTydy8NoGWJdXKwi+eHxsuo
         VCkrj59yldzA7SBw6rC4nIb3/9+HKI7rKmG77YCevbsA/byUihD4C/oJeOonlc///Kr9
         MCgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eJZXJQI2NFAxuuqevZB5XdXTMLgvzWMkEu9Y6dbgFUw=;
        b=gp+QCb0J/o4RHpm9yuzB4HZXBz6YTEcoqg/rJbbm8xZ2TJMO/Cb8/YH6vRgYe71O4B
         5H9FLpYhd07JO3ur99MAgHT3y40tSVrZMD7gGZb5/UJdu/arU5YiP7xcFDb7EbMTj59Y
         krBlSblGHvDlI47/OkC7OYdgJJS9k6FPEJI+78AhImv7SuKb+lHlIqtKbK9gLzRHBgIm
         oMlC7OiI+tlIab0p0R1x01mEk6LUZBCzbdUPicUQLJaeswoGtLiy8o87SxF3eC6lDeda
         ttFiI0lHSXAk8R5rkOfXvKpaBxXemPJQ4bxIkSeZdNjqaHUqndlXsABp66MBfto5U8kJ
         xRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eJZXJQI2NFAxuuqevZB5XdXTMLgvzWMkEu9Y6dbgFUw=;
        b=F2txzv39j3LwSGPr2EjJbF/d62Od10aTWAB3ncvF2OB1ZCqhILch6Wic5bLC1nA7vP
         3ECEX6Kaeq/KmDy9yPvvEJyCeahdBJfWi04CXY+911klyiahHBIhT9WxGrLLKtjNj1Ax
         Bd3a0FkNwYFmHZM2rJay+hZRRbWzKMeE/dU5EQXpw5LTj/Vta80SfcuDO3ncfF9U5yux
         R874ehU9yN8rFvIAKWUNys2aLxzDAtw63cZQv0ejJSm2ERF9mo8D4TqrnkV2PwHP5DbY
         Vdq1gxmXa5TG7kJIo87U00Wlfse6Wx89NjdWP4kh32jxIdhfA7YcxcaofxrPldPlM0ew
         zqjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXxhLfbCYveF951leglH51R73kuXNd64x6T4TZXcwFQXCcWguia
	Drd0vKzTC8haS0emc/G4Yfc=
X-Google-Smtp-Source: APXvYqwWbk3qJL0kWkjrv3ZWZnJDuz6wGwst/jSkRyOaaJ3pVSRZMFUA+q/iqcZUrUJuL+tKVFrALg==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr4093768wml.170.1573147079364;
        Thu, 07 Nov 2019 09:17:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:387:: with SMTP id 129ls3369854wmd.3.canary-gmail; Thu,
 07 Nov 2019 09:17:58 -0800 (PST)
X-Received: by 2002:a05:600c:2919:: with SMTP id i25mr3921796wmd.158.1573147078611;
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573147078; cv=none;
        d=google.com; s=arc-20160816;
        b=XKMXrnzDbFwpBka2+FkhhNC9l++dVIQUOE1Hm1uA0g+2mUUVpTswKSgKn8ys6g7+Kp
         y4/mSvwUJa3sH1zUB1L5Ze2ghMZWlqnrTIjPEqRhDA/+mXY9oYZOJbDUbaOKpBTsPQ6m
         KvycNEdKo2MfVaz3aitvxFfFWHXkN/fX18WFjTk/CaSnsrt/xWQzDrE1aPMbeEgbBThG
         fB8xgjlhGVYWwUjEHXvfR5471eqXZEYCIdtqdk3ClNiYwtflvtu4Jnx2L2/C6mY1gHPD
         rUT4kjXzKLoDYIblTs7ZbIqXaU27UhbKx4SMvMrhTNu3BpCtjSDpHfFWH4V8MwxL1sOb
         DBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=WCH9rsRz0d4O0x6+f8tUEmlQhr9OxhIawH0aHzQRpBs=;
        b=vsa9QFqIcwt6pGnWfYD4VJHPxlVa9V3xaNStQyfyxXenmSYFIfPVu60u/w7WavfZhB
         D7Dl+XNq+hROvhX9g4fI44xuTLwsDUb1xdkqt8sz5ujzXLJaN4yYsItfRQ1paKLEcs3X
         OEi4CO2fXU7gdgQylJ7VYP/Z26kfWSZ4GOhtoN6nxamg6++DS/M7LPhnAIB/9A1FSkZh
         yzhY5liAvc0I+n0mXZOvZcFMDBam7PRqVOU+5Yv1IVY1+pdRRYBR5lE55WNk8VJj6rYK
         iRpUqyQ2PfWeMY/9Kd1usnUEju8oZJNZOKzRMgOA2hj7U2J2IGSgR6JJXvwVQ27wwTdt
         p9Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id b198si463488wmd.4.2019.11.07.09.17.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xA7HHwKp009848
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA7HHvr2012202
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 4/4] start-qemu: Update x86 CPU settings for latest QEMU
Date: Thu,  7 Nov 2019 18:17:56 +0100
Message-Id: <237f869c07579c80e0fa121d64c100c257cae489.1573147076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
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

With the next QEMU release, VMX CPU features will no longer be passed
through from the host when using kvm64 as CPU. Rather use "host" as
model and ensure that incompatible PV features are off.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 start-qemu.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/start-qemu.sh b/start-qemu.sh
index 34dfd82..abf2537 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -27,7 +27,7 @@ case "$1" in
 		DISTRO_ARCH=amd64
 		QEMU=qemu-system-x86_64
 		QEMU_EXTRA_ARGS=" \
-			-cpu kvm64,-kvm_pv_eoi,-kvm_steal_time,-kvm_asyncpf,-kvmclock,+vmx,+arat \
+			-cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \
 			-smp 4 \
 			-enable-kvm -machine q35,kernel_irqchip=split \
 			-serial vc \
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/237f869c07579c80e0fa121d64c100c257cae489.1573147076.git.jan.kiszka%40siemens.com.
