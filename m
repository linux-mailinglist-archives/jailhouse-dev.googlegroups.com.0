Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOMPQTYAKGQER3JEZPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45F1299E6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:30:17 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id h30sf4632312wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125817; cv=pass;
        d=google.com; s=arc-20160816;
        b=sm2GXhcUvriUPMWSgb3MNxpPDCSgUC2CJ5smP5o3niyiMTOtMvmxcEz5V5fjXOrHpC
         sls8I3AGgxIUdR5JzMkpbaZfZfLt0+SwscUynfuHfkr928RZ19RjatH/epDbUq9xMHTH
         Tmnzma82Qv2x9B6IsElIGlE+XASPkPLG3asWXq6MDMYQ0R2FqRk1Kz+8wGiFfvRMN/h8
         CYJi6+aQ1hDzI/PrIMVW1MVV6cPbEHQXnCQnKZGtXF4v1camU1ipUo4dYvZi6h2zXeKt
         tEr7PrM32haSi5/SUWYEV+6QquXQbCVmSeCaCfQVfcSHSyvGcwJ/87wc/3qR9OtzVzF/
         FlmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AfoxmzZtg7b/HuXy2GLPt+kKJtKSYAI5LVdg3T7hMaU=;
        b=a7hj++KBnCVor7ROzHTtlbQNmv0azNUZhC4k6l7KDV+msxk99WJ9WekZFeRoZG1FWk
         UPr2PIsG0KeHQabbYsFId/SlV18ei8ewgKg/2DU+lBrilsrUR8YrgZVvue9UsY6lcp/f
         ppCYCkvwfNVTlEe2VpyXPo26Y83XKs50sOe1BUw7ICs7r5rbVu9yXE9qnC2eTcBUv28z
         As2i+8DePXZ6ZfmXci9Qg13wp3x4lcL0zuTPyc+EAG0Etu/DNJmBlhf435llbnCzlVyO
         TnwOysIfC9a+CWFG6Di+rFFnYxHysqljh8UP2h5dFfpqBJOr9xtMLrTuDYJQ0G66vi6R
         tPGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GvvdHfVW;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AfoxmzZtg7b/HuXy2GLPt+kKJtKSYAI5LVdg3T7hMaU=;
        b=rtNcJa3gUAQg47f7QslyxSdJd26M09AUa2Clt+3lJnbdu1Yye+RvxZMYNaV8W/yKHF
         iElzi13gk7c5KyXOWsWSKv6cs3ROKEdq5hyhWSxW+bMB+yPFz4+diBTUF1Qj9PJ+DGCo
         d8EOILaxCKC6kTlckmDP4Op9n7vu0Dgny/sYFMcpL4yqDleObepy0BAz8iZBjaAV0eey
         9iT5ggXnEcZ1DsRNqNCSkOZd0lp5ijINyUZa8PGoqW87SJgmxGYP886bBNNVsm0T/pcC
         3XvvkJavomf7lDESVoGNmoh0hTtPIToWoVmLZMRIYGRlSMtfiQEiD6DkVQ0VtMUbeOpY
         5rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AfoxmzZtg7b/HuXy2GLPt+kKJtKSYAI5LVdg3T7hMaU=;
        b=AHOi4zeeS7MHFBPxXMp7hZ73wtpVXhjmTizmtPFbX63Lki67IAbJloTzkySJa0DKWa
         /3kDnqV7Faj6XvZWOocC1UXlHDwX+4znENJq4fG2thuZHmRcxy2e+OqHQsME7wUX3xyg
         bgNrZxnpLeqiKhtOGZM0+CTQgDMRbN1hE0P2YS292IhKex0/pJcLLiHN0GObWTvZaIit
         DkpWEcIHMv482UzUVWV63Wiym0W4ik9YtTHqcDSNeURN52WztneQPBqsZWOesAHwNRBV
         wPmhNt62OQQGGR7q71JTl8uWETAlu/04WBc1O2FFfuvSf9xBEBFkYZBvP678/JShCza7
         0Jcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/aYpAsLgmqHutZ6vW0/E0lmUTEqno4YyRNdxFMqB6Yiow1uG6
	6tMnAuZfhH7VCu2GMcshSVk=
X-Google-Smtp-Source: APXvYqxTy+NIeHlMbcv0FlL7Io+8ap4ere0YHQ0GgIWCvDQCS0swv6mDRVBDv+maUQfvSvb/Plt62g==
X-Received: by 2002:a05:600c:290f:: with SMTP id i15mr246819wmd.115.1577125817669;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c452:: with SMTP id l18ls76115wmi.1.canary-gmail; Mon,
 23 Dec 2019 10:30:17 -0800 (PST)
X-Received: by 2002:a1c:2786:: with SMTP id n128mr269512wmn.47.1577125817073;
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125817; cv=none;
        d=google.com; s=arc-20160816;
        b=AAd1kHEd2u8vrMLR3665vy2kGjCmUp+/Opc9mDezCbSd57DgFlytcI/AR+XzB+lKRb
         ZGOi2vL/N1gWrlc/115ckKI1WLym64OGNklylWsD8BIIlbdGJftP6U/2kmaIPtrYJ8NM
         QiIWy4pVZST5ErB41aeFDVqrDPuiS30EvmwKfdh/155okVD9ca95Z81/F1Y9LbY+kyIC
         35+RBZrcflDFc+uv5o+SKPh0EhvFWmPKRKTgdeIg6jEjTBKZURJIrTpY0ml17wwwFZbU
         rg8i+Sgdnt8g+5E0P77D98feBTOlaPZ4m5jImN1C9+vCuOfZvz4v8/MHDKeywPoWuY8t
         yIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=ExklXquvrGXz2NdnYZcEywynNcXNxSG014NGeoTXosI=;
        b=nXu5lL9v5jljDSdy34o3qqhz16ES8ec7+iHbULTfRH3iZbkxL4TRC/QagXsVhjCxmj
         +EmPgIks/078gyXUz0ZaIksvvIlnjTx3XKNDNDDy1Gd9k1Ptc3zlaP5U3DkPUFh3qBkY
         IYkePX3EYATvmaz8VIf8/442pIvFHcEnfE8O0QYOrXL8labGkXYCZ5PXJPy8T35inMf+
         XGm15UniAKSeMCC1R36vRMAumRgd6jhFoP1k6mnsgiahOUGKV5YlXtxu5nBRynfHZc59
         18u9B8I/oGyZtV/4ySd5jRynO+32lSpubrqloOAffqs4f45WbfMj6wSXzSDEmfGqelGO
         NL9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GvvdHfVW;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o139si9524wme.1.2019.12.23.10.30.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.mchp.siemens.de ([84.61.93.39]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LtnvF-1jk78H2ZtN-011AS1 for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec
 2019 19:30:16 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 5/6] arm-common: Fix some stand-alone inclusion issues
Date: Mon, 23 Dec 2019 19:29:48 +0100
Message-Id: <0b095585b1c3511c1fab42b9c7bf4e018f8faeee.1577125789.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
References: <cover.1577125789.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:eGyw79rRklz3CaTLjyTolf5nIujy/ZvBg7z5NuWezQP/jwV+MX7
 6q8NRGUOclsB2ADcD5RbQ776E1/ywg5/fwNb/C2Hs5qzXw5YOWA2meHL4/JuHGk8/4bQ535
 g+r8inOcKrx+q9VW4hvspmJuJtjk3SvucjU8Jiy1USnGXiaAR5wynO1eTHGkQXQk7bR8NjH
 0NnqeTzbmGacK2nXMpCLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q9DhFnVYyg0=:u2UeHHj8vUIvWFxtl+88Bz
 oCjWmAqS9mrjyRR5keIny9gveFIaOnzuUDaHHMbype4ha0KS/vJkOhfclsT2GvwG9ZIDm6nmE
 pBu0Mx7b50JMWVY7KO7nhPpQ1ZaKjBy4sD+zQIT1/T2YiSg6BeVHfyvCy1v5v6istyMuD4Mj3
 Gj2PRklvI/9wzLEPlU39yJb0ZS8k2yWM8OX0QKHlpiEat0k6SvhNqS8AAGTHBjC30JKfC2hIX
 lRhTZtWh6VfB3D211yLxVM6EnMj2Njoxx7fPBSA+t/V+w0mndWAF90OMEpivvRvWVuGYZLosL
 nN/o97ZAkjqwjnEu0JXOBoV/SUEuMci5+CRgk5U9/CvxNcFL7qmcVEtr9snl2tg8wZfRyw3Bb
 1Aln5z5WDnx2ul1aJgRVhYenEB0B8TTqr3O6Z8n64fLUiHjcKk6ckI2u0dohFMufrmSq6JCkg
 JGlfbJWnCrVcD44TndszAwYpc2ZqRFQWm1utnyCROEfRnIWSYMk0CUxBLutlVwWYrXYnxR3Nn
 2V2pdYTDG0WawzjOBzbPkGBkCGWM+j3zDxIJ1bijhFZokYZlOy9qWRc4Ztf7gtmnda5Fb2WTo
 jEkEZKiwfmMo98Kyx+xpBNwjZKN+ortqoGb5R0YzkP7JHzs2lHTRTNAlmlX9FGBVkDjM8WR/t
 aKkUxz0HajtuQsEylmA8uvuvspsuCtx652BXn5v7mH0yVR7KLVInZLlzy26PpNtQT9kv5JGpR
 fbJRVK2IkUt/0jTq2CgrpS009rNHebOuc0U6dEC7wozmEJfiaTqX2InMuwGqanXAlTBEleImj
 UuboFQlQLWsn220f+jR020h3VGqdU+kGEdXMMWbnPj/pSmMPgsmQ3L+0o4Gy5rQNB8lvwlftm
 eZnO46UB2EKUoMWuX14qp5K6xMoZiJzdYsiAQUvSqpqsSr6n+uXmo+2OwRPbVbEGMD+CPfV2C
 BAxzDd0+cIhk7qyrFQVHOItM/2Pubefg2038sBKG6J+2r4RkBY/576v/MIt67qbXfwOxxH0/y
 LGmVruKuOIUVxhknmutvSXgty3HH10rAaY4EDnnw6NEysKcPGnVubdfybqV4eCDaS5amGN8Cs
 IVRLacl0j/rvDFefmMxGU63GPtpO3+K0G3xiDmZoX66yaq1WtsybrpA/bDX2YJyIHswz7pJH5
 yt52wbQpRA6AhlWEtazL6wTNvLi0LgCUsQPNAL3v2+GMSzbtoT7Vn2//nGRWVa0/H4KgqJNbd
 oWtCnamFJzyLlRiy/48n4Zt55DwTKNCj5EORonA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=GvvdHfVW;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Pull required headers to comply with stand-alone inclusion rule.
header_check is about to test the common headers and detected these
issues.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/gic.h   | 2 +-
 hypervisor/arch/arm-common/include/asm/iommu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/gic.h b/hypervisor/arch/arm-common/include/asm/gic.h
index 7c051316..e851d375 100644
--- a/hypervisor/arch/arm-common/include/asm/gic.h
+++ b/hypervisor/arch/arm-common/include/asm/gic.h
@@ -13,7 +13,7 @@
 #ifndef _JAILHOUSE_ASM_GIC_COMMON_H
 #define _JAILHOUSE_ASM_GIC_COMMON_H

-#include <asm/spinlock.h>
+#include <asm/irqchip.h>

 #define GICD_CTLR			0x0000
 # define GICD_CTLR_ARE_NS		(1 << 4)
diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index a570fd17..dde762c0 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -13,7 +13,7 @@
 #ifndef _JAILHOUSE_ASM_IOMMU_H
 #define _JAILHOUSE_ASM_IOMMU_H

-#include <jailhouse/types.h>
+#include <jailhouse/cell.h>
 #include <jailhouse/utils.h>
 #include <jailhouse/cell-config.h>

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0b095585b1c3511c1fab42b9c7bf4e018f8faeee.1577125789.git.jan.kiszka%40web.de.
