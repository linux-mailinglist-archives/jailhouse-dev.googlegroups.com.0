Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO6LT7ZAKGQELQHMCMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDC15FE70
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id g20sf9613695edt.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bpcmh8SUx/XWYMGKQGgnrBk7yHe/3jKmVWGzX3Eypv+PGzq7XvO4PpE3eFADDVvuU9
         IQtBSr+c8D85qIHuBL2Z47eIQYhM63atHvkGGsINGqcBiCw+0XGLxm2uUtzOLiP55f+P
         5C1ef6shk7Xe8RPtYFbCYJUazCd7I1kLoxc8DoW6RuW68Y/dtexLgCHwCN17wm2Gz7HZ
         aUMfkVQFFwV0bvw9KJ5OmNwEqzlYyv8foioGiOF3BujdF18CTHzMg3sUkThwW04tVGL+
         hTJEoHFYmmmxtXibM9/taFqmpS3WkYzelpMvtHNVq0Y/BJHZHdFZ+4GO9L7V1JRTgZJF
         Dbxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=IfMMVg5JmNh+Lq/gpQoK0vizPjYPbO2Uj5VgW8/NVXY=;
        b=hgy4JExPItqtSwkpW4tp1TwlgdWQ3mEUA6EenqtgdPA2WxayCDFDuM0QbzD1sruUYL
         QooWKCzXMm8ifcqcb5tMGl0frhYc2aKPlZBPsZ8S2aZqXvTCl9kDJ4jajlghUnxdScqF
         hqwbzZ/1Td+bq3VbVhyGHK8D1hcIU6ACML3WUc5ZC8Fl/Z5rqWndBKAbj4RWd/qjdF1V
         WDpdy6QBHklGVburg33VOm9aGOMGDjfHS3t7hIhYIRzTnLju/MMs5z98D3FEHjWba8vb
         rdRyMMJKrH+twlNNU0ldQSIqW5eDgg1DX/dGNgLQU7Y7dAjpG3b+w9amN8qElxgm3x0y
         m9BA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="lQ9/Krf2";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IfMMVg5JmNh+Lq/gpQoK0vizPjYPbO2Uj5VgW8/NVXY=;
        b=I8SGEAHkuXz3Ayl6xuRPzgy+ifQh28zFeZnZ9aK2cZG5T14/53txbca5cYsn/RNyn+
         UhMoT4fkNVoqJPBdpt9fyDuOoLKXv6hrta2Aln/bEyeeDy6JM/8E2WcJFlkhU0rpx9wN
         D3leqYfqsQ9eSZtz1LOKeRz70jEkA3jkxWCjpQRqqACSJUzPgjI3tyDt7aeLG6wkDsOr
         FxhiXyjpnrex/vUr5jVE2wdQWhI1eimB+MZSDxjUGhx3AuEpPw8sU0n1u+v5BJH8ajXC
         41ulX9iSb3TZS/mVrGMlDUF85uYle6vBD+RgAIoEOQrnxwBtV3PIwvKhvvqnLqknmWCp
         IUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IfMMVg5JmNh+Lq/gpQoK0vizPjYPbO2Uj5VgW8/NVXY=;
        b=cPAVSBRiHpPDPQChzfYCfajoN0gQS+PJ1+LeaI/rxWdTcWqeYQaEISbnDZaoJZFl+U
         38icBVEph7KTLKRMpE+48zQhY5QugVdpRKsHfIgZEXumxKkrefmKCuQQMdPdTxaNkVCq
         WNdmVKSVUKQbSWo148cmEXnBP6fl97uFa26dEDHwRHwqlBJnRNOk9FyCbS7TwDrCJE0z
         YyIfE632QHHnlWU69u9qbU+PxIl5mCuTlN659Pav2xKnRGInV+dcdb2y3nfPmYRAOUL8
         ZKbmRqMYMwL6GIiHJkjvWQvym7xJ3AJg/ROE0FwjnAFSwdvRWBu72QTJkVKAhCU6ajyR
         cb9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPBNMO3d7v9SQ4IdpbNL0NKyya893BnACJ3Tg6qE1EhxdQN3G/
	fTAS4ulf7m1yKU3veYXvTQQ=
X-Google-Smtp-Source: APXvYqwohnu9orlGE5lTpG06nWQumJtsguqJEIi79B5ma9QOofC3L957b7I7GwXohNU4PEPU+FKjbw==
X-Received: by 2002:a17:906:c78b:: with SMTP id cw11mr7131911ejb.262.1581770171287;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:177c:: with SMTP id da28ls3005588edb.8.gmail; Sat,
 15 Feb 2020 04:36:10 -0800 (PST)
X-Received: by 2002:a05:6402:1257:: with SMTP id l23mr7039641edw.342.1581770170738;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770170; cv=none;
        d=google.com; s=arc-20160816;
        b=YzrJ6KVHs7QyuZcgXqsfprkq2NuKbtgwIPvMmSVyxbPwjn8Z+QHBOWT6VJacjwu4/K
         TY8uvdBcs7a9xt1rCgV0KhmD5qm27HHTnDVzzbaEcfqzA1ZgTJ12dWskjGUZdF3Lr4VD
         Ub9zp6/CuE4SVzPyt3Orn3BI/AhlhMkn8OL2AzcjEhG31CBmFKh3fwVkO6920vmNwnLE
         bDvTvrnhYpr2LSIqy3VwtaGckKcGJkubYD9LXYv9sWXAMNq/xFY4F80p1Im18RAGSH3M
         1SsDDoh0cLXOlqqRBOhgBCQhUU6jexkWg2/EhFnAeoymRKr/4uyYrDT3+rQF3WW+QtII
         Y9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=xHV68ju1oR4G7baVNV8d8Al+giKOv1Qg0dZx/E5lA4w=;
        b=piiHs+8bYCifsuyDl5xVIpiJZSloHGcYLFCG/wReyd6f2b+lS2odUMZV/qC+HgCMWr
         fvypGeDIWV9p5CNGh9gKQyEGhQsk1cMLpVZnmZtZ1Vd2QJ0db8AZDI57WR7jo8X/w1pJ
         P2nOSZVK+lQxhBOUVky3eMFroa1msbH3gAnO95/BiWCSzdrcGgNZ0mg9oVDSNjFV9Gon
         yIRKSJE2HTLJlL/LMDO19ntYKnaaqf9BstTE+eIxjRLUe1nDt/HYmv4Yv1XtaZPcRoJh
         7O1pLmRqgPDb39FxatwF7qUwRbuy+3IBGYQjv5jX2qbsTBmooA+T5Cfwq0OKeRJRuZPC
         TDZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="lQ9/Krf2";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id b4si243275edf.5.2020.02.15.04.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0LsyBm-1jUlO40lwY-012WVe for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/12] x86: Remove ifndef from BITS_PER_LONG definition
Date: Sat, 15 Feb 2020 13:35:58 +0100
Message-Id: <ad9547bc7a754b60207bf29b6bd9f397cbe1062e.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:HIOsw2vO13Xb7fbULILUgVcDvw3WFYvYRh/U0C6c4Sc6szgZRxn
 pGWbYWc2N1qBQuTMLHvdwJXh1yGyNzYajCbU++PBxdt32adNOLD+5jw9CYQ10ugsVbf0Z4x
 ASDq9Me3r38jLtHlv/k6x8D50iCxs/MiOyeQ5RSabAi4aJzosnLYzDv6pmz74gsLPRA1/9f
 D7qZRAQnHplGzFIn6mZEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d8X8gZv75bk=:S5MsRxA9rjngRDhZ1awTWb
 u9zq3R7gTdg1aE2eb0KpmS01e+7WwmxRJqrpn5dTLleADNdJjZFzhXNxumSb4gxxnFOsNuHCb
 /E5pXRlLS39Rvn2ZzwFqeUDxfn6nJgs4suX6EtNxytcE8l1RiffkevyhNcTguZNl2RH/Sjpem
 0UKhX0kqTVqObC8HxTQdNKEyK8mFsBffs9XlYyDidLMnG8NLd/a8H5KwEcAB5co20lMaCR0BQ
 f49En5EKPNYMkRzDgzNaCF4+ZomVK6VYQb7esDUotmlQRul+79nUUeHPUpOHINkeJj5bMWEzh
 TXwMR4731zbQEnt2Za5Y4XlUqhzJWxots0M5zoEEZrshMLWEGR2lpk3hpIZqY8szoXIhGwGVA
 OaEjiBgcRKalUcFS9pX6z94VFvx5browIgE3gx/A/sVsL+0GL3QKdbsOs1zquKZInVd9CvChd
 tfn98AC6+Kcn6Oqmlsk6yIZeZyEATxo52Uk4VVA01bhTvTjKNedUFCTAsYBinYEq6i7Nm0w/H
 Wp0qqaiuUBCzLN8/AYncfKV3QR4QaBDjeP6GWlQZQc+wWoEkMHXBTi46h5L2r5M5Eq42w87UG
 +qOpI6guf98J5uDvY0aJvtb5NSNE31c0JFt1/sJodwhwPo437D/vkCCxeKBBIQID4QcD8NbcW
 VX8aK+crOovnKCwV3u9oyRxiCbXtYVbNySVEosrP5x4Vap4londgUgr+V/iT2IYMWt2vWLEq4
 hHAB9+0LCHDdAzgmJSgUhK0giEFGbKPIrL3g/YyODJxMznjenB67Em7xSHVLXxltBKlLwBgJ9
 a+YN/Kv1o2T7PPNWl+jcMVJ5Ze+SR0Mioz2yIfHiuPJbznediYXuX5Vbbq79mc8URrQih2Jlb
 N4iAvFAtbDnnvQcNTJq4l/LlDpGpK3e+wqa4RSL4pQtQmNqBnntejz7u+zl0xAmdcUpWhHHu5
 bey6XsHoulPCnHLdSTenEOVHQZ2ZCTmRY37ckhXE3iLQNl646SnF4Bo15NVImQgfJ5ZBzck++
 CCi1MPtblr0Ytgd9IvE2X2M4SmUj6bbKDyy23CtLlSa21T2nWTxTpZ9OyvkPkXUqZJgrHBdrm
 jVrws/65VIFQ9EKqIkhJA6hBbChRjOg5zLeMmiqA2SKpzPamV9tWkDHye51V4e+KTodjKvctw
 30wmgh64afYT5lvRzpegVrwgvOExUvinlHH9TswNpdpe1VUDOTJrbeWUYgq343ewD39JyKU7f
 0eOqP7cQc9m0XlOlm
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="lQ9/Krf2";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

Not needed, we only include this in bare environments.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/include/asm/types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/types.h b/hypervisor/arch/x86/include/asm/types.h
index 51204ce6..657c47c7 100644
--- a/hypervisor/arch/x86/include/asm/types.h
+++ b/hypervisor/arch/x86/include/asm/types.h
@@ -16,6 +16,4 @@
  * Documentation for the x86 processor architecture.
  */

-#ifndef BITS_PER_LONG
 #define BITS_PER_LONG			64
-#endif /* ! BITS_PER_LONG */
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ad9547bc7a754b60207bf29b6bd9f397cbe1062e.1581770164.git.jan.kiszka%40web.de.
