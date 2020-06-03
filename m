Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH4O373AKGQETVZLMRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F6A1ED3C3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:52:00 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id ch1sf696800ejb.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199520; cv=pass;
        d=google.com; s=arc-20160816;
        b=SBfQOHjZjJLwaEYE9SVLTUZl5USCCAhj8l8R6oK9aAzcv25anq+irozAMVSLB2pJDB
         8fqBH7YpNUVD4Yk6O/xBeigeijW+z63k8fuw4+jBk0ZrsldfHMmFQ9bphUeoc0wlsuKT
         eAxb2IE80i35GRqHh9RhJvC9+ZvyUYs/tXkUgp17gfw1Eh7Bsjop0Dr43XiLBzKrCzio
         lxp+v8y7UMbTmfrwZMz9AlZreQzgavLuf6dNZpD+D2kDWkHLVcEYXfZ5FPAfbEbS8mn7
         KL/gIwrB7dXUmsALH3CfdhJLq6gIR0QAgNK5TQW2hSUoUgUgK+1DEZFl4En55lgR6ACU
         f8Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=EAYaLpJj/bpfHUvFEqjciCKWmHq9UlQBuXneD9MU9Xc=;
        b=vE0lqDLtabRaAlL644KRKdiaZ/tOGTUZHDVIuXi+GARYZcSghmgtXDlPLwKaBAoiKs
         7h2LAssWakTwCqAM9jDX3GTvzOz9PTdBHEfC/+TMZtveuQb+K0zuxlTptWY8UsiREQH3
         5OQDLmo1mAaUEstNKjTst7WJFbsossQtmOexAMm/ZwEpBZWsezBiXSKxY06lTcyBEmQh
         ZKvU7ZJo0e6PvoAx5ctxaYxGLNhW73oZRte21MDeXxuGfjwqcVJdwwHKJFQA5K8xCJf2
         Kr+twWVQFliTrY2Xe9KHQ4YR7eJtJp+hvlznX+DUV1gNvD84b9g/bV4baJrp3qV6HGwS
         pAww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EAYaLpJj/bpfHUvFEqjciCKWmHq9UlQBuXneD9MU9Xc=;
        b=fpsfBSNJntWB9r4/sqNfdxdtqQw1q0I7XjESEXhDCgolk4Hg92VL6ZyoZvdQ+PsEer
         mo/L6JaLZkD4H4oXhUU/XwfwE++8kyZtfnhgvyCIGSn2SG3+FE4jHk3tZJwAMvBTB9X/
         ie6iw1ekUax6I0jGb4NYwo6lAjj1W2E03BF0Owz9DxM61o2nauJ3G0/MG0HING8OK6K8
         m3/j7vg93MP+8pXs09mq5TZM4XPKJyCpAtAirHdrp5SXhhL7sWZvHbpGSXG0ey11eoBL
         9iQCftvX7jjbT3b+JjBfmT2B6It4bfDyqUgMwkilEdfGaxOGhGExs45FblSzvZUBHFWh
         k4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EAYaLpJj/bpfHUvFEqjciCKWmHq9UlQBuXneD9MU9Xc=;
        b=ioGFPwcCV6Ye9HFJbF5uPgDEBevJbvf1yKbkSgiJ5QuBe6gzPaUBHVWc8VwU6+/R0R
         WyPP+drQbIr6Cjl2Vv10DGjrP4+m/djdiqws9xuVfW9+nKJahMHSzTKWo8YC/V9K9BCk
         KEas37AXT0fzf8bHeldWPvRJEnpi9XFmUoP3bk6uOaXfFZHKoqSNE9lgp34jRMxEPKlV
         h3SQfbWRDh1pkwO1iQOBSwaMnrQFLfXiNJzmwQ1ovgce3ZU07xG2Akkv5ffJK6Mbu2zt
         E3EUj/I7v0Enqala252+PMYw+ar/L5xnrKRmSRBG7NfaZhcU7O4lpx4Hf+gttMxjUVTj
         b2Lg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530fqCcBZO3tk/JJx91/7feay1TCwOFcZdoqruiO95pQCHtnwl2h
	niRmiG1nyID64htsY3XxFP8=
X-Google-Smtp-Source: ABdhPJy5YFEZnPCVFP9Cd7vTtsQ+qnwt0OhFOCkUtOzvPns/OMKXmre0gPJfEJlutMMHa/VJLYlh7Q==
X-Received: by 2002:a05:6402:144c:: with SMTP id d12mr67237edx.386.1591199520025;
        Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d987:: with SMTP id u7ls2938965eds.3.gmail; Wed, 03 Jun
 2020 08:51:59 -0700 (PDT)
X-Received: by 2002:a50:fe07:: with SMTP id f7mr30593edt.315.1591199519418;
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199519; cv=none;
        d=google.com; s=arc-20160816;
        b=Dpu0S/fOq60wHK1kCjxe7C7FTBeb+biyJEL+yRaunlTxtnpbgrrW2U1wVh0KyQ786S
         2pKQU8ixJ0eDQHCIBvE2onSVo5NFl9wtX6ny0Y/4YH5WXH3ZeYK9klWiBZ61IMp8voJf
         MJYk6D6rfafLf1g0T+Z7IefwU4s5kMRUaY+6CtcuB1NyI1cEcTi+S6WDVJL//L7LNAeL
         EkNAT3ygbmpBS4p4D0n6MjJlNn3RPga4kK9TdCbIL1s16Z8eKgVNVtrG2v8kENiuotpj
         piekZkZ6jPGFs0SPs8NDZGEIdfW//JQZVBspIyetKjhRZarXiq08bIFYA6WJAVc7rfQc
         sQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=KHVtoKl5hTM9HjIWWAHObZ1BS/vOb2LyTlzi32M9u24=;
        b=KHEDv80kSt0XyPjHX7e4hLVCqQ+yepBtolDUoeHYL0cFYRNzjzfXtwUqs++ucpqneH
         k2BgdTaE8S6LKOfqU7m2enmTrfEHUd7CHeXpsJqkoHUYtwNdL0Ql/MYld7z/or8btRDO
         nIyRgNE4iaQUg2l3BtGYsgLOhxDwdipRYcp9lxPanzTVjqTSPNB0VBXdokGSshJAL3UM
         0tMQ8j2kUt5ImEmvIBfhcLAvELcO/SB4IKYpBOTUqmvT3YtVDLsv6CaCn3fV2IvQm1oI
         rtY3qB2j3aTqe/zdKbzba7trbUWP7et5Rqj+xFns+4EdqaaucAYE5fidS61/9F8UA/0l
         W+CA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a23si119923edn.0.2020.06.03.08.51.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 053FpwYt016297
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:59 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053FpwjT008838
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/4] Update Isar revision
Date: Wed,  3 Jun 2020 17:51:56 +0200
Message-Id: <0d0163f93bcfccc498a1e3d9b986c50738bdf255.1591199517.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591199517.git.jan.kiszka@siemens.com>
References: <cover.1591199517.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 kas.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas.yml b/kas.yml
index 8cff59a..f710cae 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 1cfe166c5e53ae96bc07b895a92bf6cd7ace7bc9
+    refspec: 351af175bc54a201c6f44307d4e998bd6c0afdb8
     layers:
       meta:
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0d0163f93bcfccc498a1e3d9b986c50738bdf255.1591199517.git.jan.kiszka%40siemens.com.
