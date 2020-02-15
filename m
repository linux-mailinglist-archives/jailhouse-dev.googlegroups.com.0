Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO6LT7ZAKGQELQHMCMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id B711215FE72
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id cy24sf9639865edb.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=hRC0SM8vV+QbSxdJvZRhB38qj0uvGon2o+imLDrGZwruouiRRd7wGSWHIIWUj3nYoj
         225apX8PlAnDmN3iv1BAmiiN3BV86DqRSwOXRZMKvjycZxW9ucK2ZlaQOTXyFUItOtte
         OQb39ocGK1t8EHm76S/etO0vxnCWqmvHIwWLO6qh0wgHeMx4EVEFBbjSyix9vfCVNuAt
         4ybsQlnFS/7FKzEKPY5dhqGOdW0bbbN2aFz+9HX9rQp+TCF3Yseufo0naAUe//LM4qh8
         aGBtQZpyEXWs1Qz7iyRwYZbUmHtNy01vYoXrBjCkp9Nt43qAk7PtiKsXSRNNX8wLXsWA
         nUOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=on8Z+hpq53sZDveuekJlZiiy1rVeysr8Qzb64UndPPY=;
        b=UQZ3VuwV+YbkYl9Zd3mBzwPaq/k4p8tZoOIZ0IrXeggsWs8ZOBRsBYXNB8HkqZ/jaL
         wod+WuRozDejbI4/kqDA+kxSTT9VVg4zoULzOOGvezIV8trMYWfSHrH/6qbCOQ2JDbLT
         oc/ubuaLbmTeYA6MbWSN4xqJmOKIp0pLZzAcQLlZIz1fA3vcYh5EQuX+qyh5hiyzZppa
         imtbvqTF2wmI5IWmDca1AXLhxqgU2Xn8fbYV/+l/sObrkRydc015o9YkzZovchxSCjwB
         wQpixMoOO8bD2u+zqavPhSQ61HXQGToJAUFl9HNdim4ArZt2vh0G1bIyEqQQ9uqMEDhS
         7gow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KMh0hMSJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=on8Z+hpq53sZDveuekJlZiiy1rVeysr8Qzb64UndPPY=;
        b=taiO1N7C83IJseZ2Luw+GBTPSPj4pxj7TQ8klAlAM7W2nNZQ3ZZJqyUdFStqj5kbbU
         pQ1NXIcaenncISZDBtxBL85h7VsZ3FcOYElOanH13hJiFpjsJIeAO4dhN0XyUZE4Wsr4
         eJ/WW81qHzxZ/7abHs1ERp2/tpNzMdgzlgE9+fWOcCq4rePSwZZiM72UmiKM1Ya4ebsI
         EdxlDDPOnllA5Gi90nmAoAOu2+OyZwLk1iDBd44A9KYPPjA6A3ZgwmJzpsAM4RkSYjnF
         7UP42RtgSV3kYOdRSj684U8tG3+ugeQctlkJTcW6h4p1AZmhQ5/h+JhlA2iyle34L3ta
         u+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=on8Z+hpq53sZDveuekJlZiiy1rVeysr8Qzb64UndPPY=;
        b=FXW9D1pIDMvVsdEPULb989GTvfgWgiyeurruj2GaCTeK7QMtytucTAkXaRwnh8MBuh
         dcZoKKnSrjb7NnyWN51zUxPzqNe7Vh50dRkvdI5ImKjXRAEbyaM4md/dPaEY1IpahoTL
         GTi+4z98OSyx6aV6SJHOnHW6pHTkxHZs+P+z3AqWYp9qYmpEByNqmUvJA7kUKPyxxEpx
         wbTKcGz2HCplvfNpvJCyHoL3j1VuOT3P3k9PLRkZDVm6BBT6ge4EcgK/BrG6wXZw5nV/
         KRW7kddTrYSvwZzAYmkrBUPvJxQMkIfK5Al4DtVLCBqwKGspjNwcxabaFpK+ObHWAULR
         d+yA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKI9nBZacUx/u+NnpTZbo+bZoYP9XyEqx/GeravxiGe6UGQ9f7
	FSfvhDBBsVfPaxSiIzrbxRI=
X-Google-Smtp-Source: APXvYqx29PFiCdaXlc9TYRYAcSa5YsIKFEXoiN6jgCB3XFmudVWTSsQYfJpgqVCauCcXJq20HaxBTg==
X-Received: by 2002:aa7:cd49:: with SMTP id v9mr6770090edw.269.1581770171519;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ed84:: with SMTP id h4ls3007513edr.7.gmail; Sat, 15 Feb
 2020 04:36:10 -0800 (PST)
X-Received: by 2002:aa7:df0f:: with SMTP id c15mr7003313edy.141.1581770170894;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770170; cv=none;
        d=google.com; s=arc-20160816;
        b=uPWU8ty678VTlvTxYqwvvbKcmrSWeAGwEbcg0oJKD0KuLPtU+fF13Nd3qOyK4EBts+
         qJTp+Nlu17HL6k6rEahiF/lqqukL4keXYI5mje/W7RRvumqUvwBAuxXdiEE1tvFL3Ntr
         gi3G50Bqv0Bwq7O3SvCVXgQhgSvwT0iG1tKdiVOz6npnGrcpjC8WDpIA2qw7GShxC9Qb
         I2te6ZLICb5c+KPiV7ZRI6xR0KvFcOX/7jCWrbpE2MB/8/EiTwN3BshpvdrMSX3NN7Pa
         BOZRTp+mRwYRWR5RilGEGLTXxN3xnycHhiCcZsgxxdM9w6oGjeq5Z8bJaS3uAwZFNsji
         T0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=lZp4Yn6keBd1Yx213i6oXuUkEy/tGOydzjRIlGewByI=;
        b=S4m5vZVl1sdLc2/UJP2fE4yL9wsIKcYcUTF8Q+3fuXebxCCMPMham+uslRdrZiy20x
         UscYrtT3a6vxnaME3VuwEs8hofgtM3ei9Y7OeIeXOjAyeSD8enc/ovyOz/YqPM9ikAtZ
         LzRvO7Pz6hTOSXgy08hW3qUdHmu1UusFiNXxrEMiegH1sBp4WQjxnsYSpvdioUkul9dZ
         yoeeC3VotZW6Fozw6syCKyfMAJdDVTIB/cIGyPwLphrzBKJWJcxIQhqoL7ye0dcaefHl
         D0j9RqeNC+PRh9Du9qPXoaCygD/T/CQZG8XgVDCK/3dRtEWOzOVwhrsqEEYxM/YsyeI1
         30Rg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KMh0hMSJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id z20si409675ejx.1.2020.02.15.04.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0M6ml2-1jNeO61bLo-00wSUm for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/12] x86: Simplify iommu_select_fault_reporting_cpu by using first_cpu
Date: Sat, 15 Feb 2020 13:35:59 +0100
Message-Id: <35064003c32d04844334b2607d30bb66aa5222cf.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:5nSmk8E6KBxnz97pei8ZL5baOWXsWZOMG/5XMMwyZSiJWBs0FOh
 MXRxTsLs1YusFU1hs7ackme/foUwjhxaoIjcB6H8u+uf0zCchXHZzp0is66WpI4yVvjPZNx
 PXFGiTwsYfBIGbrwCTY2jkzQ39Mf6ETpEh/cWluxLMtD0BhXFbzmAT17fzUiz363nQryUod
 5kLRdlwygapoUipY1w2HQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jPZvU/7/GOI=:9RV1qBVcvHmXa0LZvSKJyY
 aienZyegwJkq7EJHleebZ3kBmebSTb0WIucookMNMcna+L0Qq4Lr7pcQEzTVHzx2zfPkc3E0/
 PJ5XCc6PwfMaxIuHrsEdtHQ3CAeOuOPpj7pMRM5R/Pg1SslFRPNXBidcuaGfCh4kD32F6r1bF
 GoZqgq3wxA7EqPwMF2LgH75bX2o6bQBEqL43z8QIZ3VeRglslzN6eSoBwJ5/TNqlqgjd+Sxzy
 SS6BGezZCru6j4So3egoP19NMwUijWARYgwal+2EM/SNRK7h87OctA0MF6WGHdBQAnTxC80PT
 a4jD0Y8aM6LtDUabPc2R1kfx5g8rGPiPHhbEhzYnkEmtg3IaXreMB8MOP8430/1biw1xgUVTH
 UIkwsyt4YZNwactll4rjG+QtFw1KWtZ5xbmgnv4wd9KZGRXwnYol3zjIuJjMZYYpiNVe0MVdw
 Ce5/xFsO4s8a5x26+J7mvPFnaOvujPacyifQ+zLKC3Dep1KhpeObcg9UbBxOOq3dpFu+QuxND
 IGwF1cWHo4QEMkFhi3GtC55SBewtRbA79ljYnrolgfopr1m3t71x4yumaf4ZMruIZzMl4Acg0
 ma3/jDujwPPTa6G028GSf2iTEqd5b037A7uA43OkiL1YhMP9qTkZ7Kx9hWWcIjAri8P7dl5Eu
 Ftr9YeM2LPqyFCSW5hcVIEpa+1aSIxAat185SQ9gJDTJcTUXWJyjrvUIzscyh5D1SSNKI62+d
 UtMA0Q7U+qlNSInktzjSLzEa3hpTA9V2WJS9FuRPsmruyY3/3JHSHwfWrPYkYZ5CwNjyJ2yjk
 GHbltMafkZT+7bcYnhsY9osW+43bwIBpnp/uX/iLfAxFMzMMYtJQysTdAN6wNrWXLPuY2WmWc
 2frM0kz8rGznzn46ObPjACZ/Kww0Fy8cSKpsxEl7sucmTf/0cjmxnE/25BWELUVrezg/KoC07
 knXoZejadO36AHAOBUWXENWIVsWGO9QBlWHoAyoOrlqlhAdGgkA2N18IUrOpISOp9ozwL1wRS
 GAy8DVEwgkjlSEzCPaJUD0jxIllzHzNnqlUcBTC2WoT1zW+gPkWw9BXEkENWVkG82AQ19/DRJ
 pLj6F+HzEaVBl8glcTMH5ay0ACC4kaL72Yge4beBktT0ujFoX0Ol7nJigtYNpLJc0Nq9Zm23z
 lELCmQOVTKZfg1XQKBidsXUIkDOp69xC7SBLo/LIxS8FAXefcSsRAPUMVo0vOqSgDzW2bQof4
 RoTHu/IWVEgtopizk
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=KMh0hMSJ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

When this logic was defined, first_cpu didn't exist yet. It's finally
time to renovate it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/iommu.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
index 68ca323f..de17144f 100644
--- a/hypervisor/arch/x86/iommu.c
+++ b/hypervisor/arch/x86/iommu.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014, 2015
+ * Copyright (c) Siemens AG, 2014-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -27,18 +27,14 @@ unsigned int iommu_count_units(void)

 struct public_per_cpu *iommu_select_fault_reporting_cpu(void)
 {
-	struct public_per_cpu *target_data;
-	unsigned int n;
-
-	/* This assumes that at least one bit is set somewhere because we
-	 * don't support configurations where Linux is left with no CPUs. */
-	for (n = 0; root_cell.cpu_set->bitmap[n] == 0; n++)
-		/* Empty loop */;
-	target_data = public_per_cpu(ffsl(root_cell.cpu_set->bitmap[n]));
-
-	/* Save this value globally to avoid multiple reports of the same
-	 * case from different CPUs */
-	fault_reporting_cpu_id = target_data->cpu_id;
-
-	return target_data;
+	/*
+	 * The selection process assumes that at least one bit is set somewhere
+	 * because we don't support configurations where Linux is left with no
+	 * CPUs.
+	 * Save this value globally to avoid multiple reports of the same
+	 * case from different CPUs.
+	 */
+	unsigned int fault_reporting_cpu_id = first_cpu(root_cell.cpu_set);
+
+	return public_per_cpu(fault_reporting_cpu_id);
 }
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/35064003c32d04844334b2607d30bb66aa5222cf.1581770164.git.jan.kiszka%40web.de.
