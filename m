Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJWDZP7QKGQECZZCBDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066D2E92AC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:39 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id i7sf16747104lfi.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752998; cv=pass;
        d=google.com; s=arc-20160816;
        b=TJCVNNQfpTavn6t1Y7t436Qei2NC+RdSc8Z8OhGtkeK2z2G5dP6Jdmp4U7TJyJpJYL
         xou4rkwV23xn7ZKOTVK/md4UByDB9D1o9HImgzYh8pgPWLNbTak/zcxxXdb8L1UiOzFO
         yKhk0gJc0jYzUKJS0YSsvVvcgwvYgQN+Tf+mu5aOkn7mlvTh0rIvge6hKU4mdMXU+hXp
         JctK+D5EueVf0SqGPayNPy8FfKk55qcUV+hkr1INp//YZXCtGYhL2R2t/DTDJtMERQnE
         Q2k5fWRCiq3hBqtEy03AbDAijDc8oOtbtm5BWtZhqQJr8ed+pkGrg/w+dg8uqy0Ed5SA
         tFsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=S4mqFMuS3VG08ZlQQoveCnT/KFCxjul6XVWJOXATaMQ=;
        b=aIN57VE1e36Cf6sDnsBWXOqxrLVPtNMFC/WD4Cwf6Rb0jksqgvh84KekkyPcUWPwzo
         lQwu12iAI4aAlKa4yi5wZ+vUs8JIrUFBn5syeC8boU3AtZFZ6Uxz4qnsdlYZdCP8B4K8
         1LFSxOcJW4E1CmhoUWbjUpGvJ0Ik+hgzYZRc4QeOF2bqp/kJnCFodraVCP9m9CIV5ghA
         G7xl5X5QlfSrMvqw4mYYilMbXXYLG5ZhImQ3G9HJJPv5DsN+xML5MJvtdDnKNthdtPjy
         3J2RZiB1mckx04S0b1uS+gl6LUFxfcj4ZAc0iVZ4erO7K83dJA7bMOxvkppDp8wm7yw0
         KT8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CDnWBIJB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S4mqFMuS3VG08ZlQQoveCnT/KFCxjul6XVWJOXATaMQ=;
        b=kHh3RgduYIiVp16Q1XAFdYxuMaE7PYWazVTtYxtUC1xQyR1A1Icd3eaMwaALVcMg84
         8vgV021vFFLL0PwdZTex6FOVj8CEjYoVC7VZGqepo1sIUOJUGYMZuODY7JUZPh7pZGGS
         UTQuVVTfLlSK1Tvd3lGR5A5Gnn4Ioik+fRdfupN9vxcvXEPzH8ihrHk8BCe7W7BDINFL
         1ywLb0E9xZ8nJ9BCD6MbuXzFNAhkq6eNspSG4zwvLNGBHNsxbv8TKTLYSO8TthTs0P+r
         rSRMEVQ45SbJYv8gvO6WnbU1NCq4Jb5V9lVEqGZoWh3P6Rn6k12bYbW3/BNNuYkTseYG
         i+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S4mqFMuS3VG08ZlQQoveCnT/KFCxjul6XVWJOXATaMQ=;
        b=pV1bMYjTmFuw4k1S34KNc4Uv4IKxqBRjzVruf9aIOJCTbiQuF8toRmrprkNj2qa311
         pu3CA8W7d0+DQPFbRr4wEy6ImVmJ9xR/iEiXehosnpCB9NcWudsg3YlawcQpSgstzQV6
         g9Y0OWNJUIh33eGa2YrtWFfMjTzz70H8BSRSFklAX508TjdtG3omfls6sst/J7NzFhIZ
         hIRY6Ji/AE+uZAmoiDvf5LH7HLQPL7+q7YJOhGch0MYpGiEzVAzvMA7SvnkDznnAKktC
         6/9kMwujk2xbGFo4kew0y+B6ZWtneXZAvmPN0yDmAk5qBwZtfyM+oGtRav3MCMknPfue
         tiJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533K7G8Urlv99wSG0WGi00HgBYZ7UkU6PewiAlA+7TaseVsyUoHn
	Daq7BNbQXqRCNkqRsvTlI90=
X-Google-Smtp-Source: ABdhPJwI1nvf9ff+ja1Ds5ItUXok7oKv58sL9TIFHEASl1QfihhoB0rrfbZgscq6wnGQUuXtQFDnlQ==
X-Received: by 2002:a19:7e89:: with SMTP id z131mr30037338lfc.2.1609752998635;
        Mon, 04 Jan 2021 01:36:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10d4:: with SMTP id k20ls4777775lfg.3.gmail; Mon,
 04 Jan 2021 01:36:37 -0800 (PST)
X-Received: by 2002:a19:cb05:: with SMTP id b5mr26635414lfg.61.1609752997689;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752997; cv=none;
        d=google.com; s=arc-20160816;
        b=o754h7I4QkrM2cr4BxqRCq5d9DCOA7N1XJ1I7HFfHCV1BQtCg3zXNBSp7CUucKuwBN
         RzUldRn6V62nXZ3r9qIWo9h85ivnsHUmfPntlD/tV2+bx8RkY9U572xH+sWi0ma9Vggy
         ZFsX9ak+zKTee4qlq1+1ZXKoGK+NNefsayyO56g78+sMACZsKild7jbOVllHsMbXJ8R0
         oWa9GhtnMv1krt5tr2r9tQfMdyhJ/4HdoMuhShBdKhL6LslJSp+ad9pRSq63isAHUkbo
         5af0hMhIjXhqzgeatfG7V7+o2wK4EJa4VBivzf5ZxIRr+H1vR2wuR9C0D2jDwntbaG5L
         J4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=IcDcjSjl4hyQPABp13riA0GmtuTitLVAGGwFNLGv6pM=;
        b=OBHZQikI04h7o4gqy0Ns6t42jcCiNDvAl3Ht+maxmWoGGFdmzCpN9xr0vb/vhhps9/
         B4opwYRjiu1Nvk+LuzK8P8jdh/Osg7xaIy3YcHcsKT1npT9hkfPRxdNn8QkULU+j1zhd
         NTByB36ECLCK4uDgQX200+uEeK7OmbghgnEYVBmwlzbmjH9Toz/SkfiRpM4dL6ic726u
         iZXfzfBJv2m0YlJwAJ/iJ5RYwHOa0sd2454CR3Z6CGCoj65iWmBM0ER7uuPN0ilANKZW
         7//KlB0qz46UwMUvFDBukEaV9ehY5UghMUKSle0gBs2h/6lvED5nRcSIupwwzqbJSelc
         32vA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CDnWBIJB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id u25si1611159lfd.11.2021.01.04.01.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lo0ZA-1kKqgX04lc-00fxGj for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:37 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 6/8] arm-common: Account for SMCCC versions > 1.1
Date: Mon,  4 Jan 2021 10:36:20 +0100
Message-Id: <5c5cde20c9a855224aef052d9ad34a60fb98bcea.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mOsvzd7TG7GitRBxWeDCOB6rFt8UOx965KdUWlcemRafzDff2al
 UpHseDnn+rzZsypSIvGtZy2o02UrLlJm+1uRjtbnfY8h56Oh9GCYQLrPra4hRx/yn6FI1bp
 D9ErCVfPrKN7pPk/taT3iy02KZYQThRaB6a3s7shI5S5tCjB5TZW2gSkP9J5CnfzpPyxeXb
 WxJEixuQffZjoDqjV0nmQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+RoXBcMAvF4=:oUd70z6nRvJkBfkcwh/eHo
 I9X2nv4Zw3iKkXLw7cYULIIo3NpiIk/3c3w8sGqNyMs+NQiYDhES9E9t8TV34gWAY57Jiq/bo
 tUQqSJI1+rf21/Zn69kanNqcqjkdQxYCSOP5nN6S+RlUVOpNMQ+tsPwMluM2TpQTk+E3qT7dC
 CcjYsai6haees/nPuWaK8Y7/0qT/O/Sy/+WHu3g7hM6lMoa8AsIvSMBxuwS9CXoLvVS+g6mFm
 gFOeZCaMSirc5aeG9odcTYvq85M9UmGNQKD2l57Z5yg0Y1rMkzOt6QR8TeXvYRp9oFdoFurBZ
 AK4qjgBlj26DVIpOne11aBbM8m44TUhzIFLIx1kFG6XGkm3JYtApSkP689AFfY2JCeKTPogz2
 sa65/EgwAXA/7cC7qYgs6jQhYbeZFg9bc5O6lzCyVO/0+Y5yNLrrUA59dvQRpqDtUFay7hcr6
 YCl6+CWhkPn3UUs36Lt9Oc7wydHLvaOHgz/Rch7M/gcVUjo7sEGIeC1c3eSTkvLqXPBoB7N9X
 NUEKhVwkNwNNrsCm6O3+/UzHZGyMlfHXEiCkJ5L2BVJTb3B1VrXEktJ8XrmSsCyfojOcjrGQ0
 CttzRMWh/M/POUL8jU8dcFRDn5AXbe/z5YyqFAqLZU6B5iOwXzSxM5nKt7BPUx0q4CQHl7bji
 GrZLnIrjmm5e3LU8GiZ1ncbuNz68RaKTM0tAdOS3vur0A62TfytG5zsBMy5jnht8zz04n/CQB
 jEATz11JfmTdWzgCY9zNYDd9nj5kJy/Uj1l61MJXQpKri32AsPD7rkA0K5uLeIzb2oJpy8/OZ
 2Kxusfn+qqWPtdIu7xfwmpoZaIDJaUob+9/4lv5w4adNfTXuMjRkcGjBox5Mbi6PKe22PnG9S
 f20zygvfn+onaP3uh0jw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=CDnWBIJB;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

We must not limit support to 1.1 exactly. Anything newer is fine as
well. Required since TF-A 2.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/smccc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 7734b999..bdbb067e 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -33,9 +33,9 @@ void smccc_discover(void)
 	if (ret != ARM_SMCCC_SUCCESS)
 		return;

-	/* We need to have SMCCC v1.1 */
+	/* We need to have at least SMCCC v1.1 */
 	ret = smc(SMCCC_VERSION);
-	if (ret != ARM_SMCCC_VERSION_1_1)
+	if (ret < ARM_SMCCC_VERSION_1_1)
 		return;

 	/* check if SMCCC_ARCH_FEATURES is actually available */
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5c5cde20c9a855224aef052d9ad34a60fb98bcea.1609752982.git.jan.kiszka%40web.de.
