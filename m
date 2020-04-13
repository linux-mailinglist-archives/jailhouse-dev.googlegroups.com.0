Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBK4Z2D2AKGQEN2IG7GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD51A6342
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:36 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id t194sf3464478lff.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760876; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q9bVz2CtKe+OsW4DrF4SqAeCmCylPsMSGM6hk15WiXdXzbZdXMprpoWJrDLEJX8pWC
         fF4gimQvSAf+8po2jAWLEfCv4p25tt72tClnbti4ZsCXeEAtzMne396txYadf9mh0WiN
         4oRJ9p1Bu0xl9JaZIIyLQQOAIqqrrQFRzV/gcOztMTdDwhBNyfeXx9nZFaOsoUc5hSAQ
         j5+p3+cKlPooPONgjxMgmrZt+xmeqrS7qe4LCoqahSEmF3x5YJq1qgEAfsSXRJrntq5c
         lKtG45mIgZjewfMCeXTGJbe1BTKVOgMCbnYzRxmJtRsSVAkNgtKN4wx8+Ju26yAppZL/
         4GGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=QoEuxK0aYr+8O1l4zxm6Sr1VCieP+PbCIbJT9ERVtME=;
        b=squjtZPF+GlGG3lrtblOqiiKRV66J8R95KUgKR1P9MBicylXjzrTcd98in2t824/Lf
         r9O2F9LF7sxWqUHKX98GERhwmCjV5nBAMpCRZ7oWQdUWaHkZA4eVvmvWb8BBHh0GYouK
         erzZXz6Gp/ehe2kOd9T0owKNlR+/sZoQaHYtcn6kVYBx5mYlMtSPe23GsOEOZhkcn5Ms
         zQ1AlVUUrlHaq+oWLS49eiQa5VI4J0ZW0vwW+Vet1QGZj8bLWnOfzfFYXy9qAO6e2M0C
         QZJxkBSXgQ1bFNPvUfAmUEY7xjWNQM4cTvod1AF3YVZtdGiEd8H9Ojt2SxK8r2d+aRpt
         UeuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=h1xflFAB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QoEuxK0aYr+8O1l4zxm6Sr1VCieP+PbCIbJT9ERVtME=;
        b=IfOllWRNaly49Lmhv7S+dHmrF/hfBAgMPAcjf7PiEEQK8mr96QqoDYkEps658Pn/Wq
         6o4uP2K6OUiU+YadCmhRFRB38MtHd5vMyHs8dBnn+l8tF+i9EphkJUQHGwfQa9RbeIWl
         VFgwgMtWxmEuOOvvTuezqbKtXvk04GrYRiAJhTQzBmxWmFaYVRrzxmY7GYC3gkGj/OVz
         9FYE2Mw/26TjTbuQ/XdHJ0n0AS+5cZEHGnO53nZo9owZcWTaE8fUBJA3qPTRoOIVCL+Q
         r7KYJXYzGID7UO4AanGku1Sb0tqArNakWolQSM4jkLg6BiwUEugD7v/7hnnu+jhcKd/i
         0Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QoEuxK0aYr+8O1l4zxm6Sr1VCieP+PbCIbJT9ERVtME=;
        b=kp26zC0jKylG8fRy+6Rtbzilq/wMgWg5XeyMJM1bCYcdUueQZXjbxIJslRMshWTKZD
         Z/Pd4RmKvC63W9A+5/ribGrNaKcaP6ihMR9k1qNVTKo4yMKMaidn+qy4GkhnHh20ohrc
         T4GxrgbS3gL7TAFJ0LHKvZlx/Wgsh7mxhUDO/6kTv8xRkiogx1JPxeTkiG63OjercuCA
         BXl16K5qnOPAbFYFfS7qulZDJ45wMWI4S2cK/NWIoTx4fsWt6MCCAsFPJuPbA30FysZ0
         7LjLvISu2Fhywpl+PdumKVWfzQJn+QymQaUhKnCYzwx/RKiYkadCfcH9o5+4AGBZ/RIF
         GFKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYUJ/wLSWNjs+F4ck32XBPKOqQM+VtTWUncG+UyjugtoxI4aTwz
	B7XuC2hd3LqO6kbwoG+y4Ko=
X-Google-Smtp-Source: APiQypJOny7tjCCI8deAEo+Otkl8XcyJ8Q/afJzjygIzLbXd5KsCWKLBIMvXVdXBQ3gusRmc7yqjTA==
X-Received: by 2002:ac2:5dd7:: with SMTP id x23mr9784940lfq.48.1586760875949;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4a42:: with SMTP id x63ls2604308lfa.7.gmail; Sun, 12 Apr
 2020 23:54:35 -0700 (PDT)
X-Received: by 2002:ac2:53a6:: with SMTP id j6mr9682743lfh.153.1586760875232;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760875; cv=none;
        d=google.com; s=arc-20160816;
        b=Gg8aeWkDxEwmIdPXbnm8qrVeon4u5lJU5uNI6hZemtIrIu2rU+eY/aIUDalXaH3NgD
         apiKs0i0ckimjKSUIF/C+fKug+Tbz3pALKVCsQyDTfOqRB/y6JkS8qtNiOkf2ooZALFN
         MKBpwFUCx4smMuT2cxRSltaB811Q3yKeNdvfixmNvEqC5i4LioBU3myxypxyroGzOWXF
         3xs05k/dE2yA6Z2Yi/E8ntWpxYswhmKcR3f5L0ZIyFxGnSwJYyE+Z+QfFQmdy3Y93D8D
         XQC318QCZdZqEHchWsdxdUc39nELPQkqAPWdr9QWiZpWdk6F1/5sY2sL8Vi1vEF5RmUK
         Vw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=o5jAIjfCiuTdtNM1BjhJTwNLE0s+/LirKUYFCvcNBEI=;
        b=EHwzQzClFnlB7ks4cscxsL0QQNEA87aK3CfRJ+kv3L8T/jh5eHSHzigw5i80CoBIxP
         Kx+0uEkywr1vvIgu9kL7BWddLs9jOw26WRkUOTs8LEYnfjAsSAlVDxuqyb0rmeTRvXwk
         G1kpFgaiyImNaIKywe/nVqWm7FOfiGJBiODKMFzThZojgGKpvvrz2rjyZBVY1oZt7snW
         PJrzlA5z+RVDAh5Ifv/r8NNtfx42Z54g/JfryiBtXobZc+dxAGY5lze9hI2TNTRm8rbK
         iQHIQio6KyNpgAVF0vbQwVu+cHI74jBzIohaJHXXYGqQTsXT4AqwC65eZAOB+/gT1l5p
         rwXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=h1xflFAB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id k13si404465lfg.5.2020.04.12.23.54.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Le4Tw-1iuMac1RM4-00pvHa for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:34 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 06/13] jailhouse: Refresh nuc6cay configs
Date: Mon, 13 Apr 2020 08:53:48 +0200
Message-Id: <3e2becf0cae127a8d87af01489fda95e258cc6dc.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:oMSxlsOZni64DCPOhNRXExUhEyknaOVoKQpumKu9iaSU53WpxFA
 ULPT6Ehc2dvOTtsuAbzcrU5xhoWZ0wWs8t5GKUB8nkMIlakVO1e252p0fpfPayIgQmzTfN2
 6sU3voHiHVFMJt4Lpo1NlZXMjBQ8xNNUxUSi5ShrC9ekKnZsN0MchMr+ErqDMYE6yQ/3GBg
 Q6L60yV0pPd40eX3njdmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:33jQhI7QWIA=:ajJOF4MF6ONC/5ec80t/P7
 EoQ87LFX/+nNqThSwUb+1FvK34d2436y3A/IJC5upHepavekUhy9i1iuInuaHsR4goOcjIKd4
 EcZs3ArspNDoAA4G/jLMjgcEKBwYujAjRP/hmCkUmLv0Qa9pbgaxdk72ARz3QnDX15DqgsgHL
 I7ekjp3f9YAtgGfT+4qP/a1J+akWWy7a5RI5IWhNvjx0qLXIQ+k2n6nz69TaOzZsuXSPm3cPV
 isO9LGJnzZFdnqgXP/S/a8damBQmem69SVIbcE7sU/gJFvqbP7hXid55+LFdFMJ8dUwQBPj3e
 YXSV1Mx3Q8YVxbDJRCVDzX+a8yAXzxC+4uB5DGL6JEwbojOZnjT2/iTd8JunLv8/bYzwiEI0y
 QNq1/uaXaukOwPyEf0Ehrwz7yzA2D0Jq+CfX+h2b0qq+1bJmG8lZS107JPWVbh+7Smn50AZyj
 V1DendFWyHezQ1ZCciXcs+U00JF50Pu6E7bF75fFVegn2w5Qg4SBwVKU/kGW1i4C/B3APRbdy
 DklXg9VJBQYS34NHM0SlmwOoOB/LPc4mUz6kKHqc7xc9h7jnRlLPNzg2RR4UwTxTJ4Jq6fjaa
 kg3JY25tzDnf7/ewvY/OGab7jBDyyP+LdIjADYc9gwELhCPuaElwMSsNq6+ZpjRSE469FlU3a
 OMRhSbDb1K7up6vzLDWyG3s+dNqOrIOfofSiWyrr3b6Jb2e2c4TrSrU4vI3KhtW/B3W9no/iw
 z1bxHDzE6EjvKPPowXvvc6LMrfQpsOzjIbTqqG4IOlvBqbougNnFdrWiL65vw3uKyHySsijcR
 g91qS/KkpfRvLg3Ww/0Q97OeSSlWJ7zCSgC2gUxNkNjQc8fOOxUKoJgvwSUPBPnMg7jDjwiNE
 NN01lAqKVdnzdHGwvxzYocXYK9cu4KZwvjHLUlG0/QV841Y50sTavZzlndagnFaDJT8LrUgbV
 zJHHIRh23S5l/1j9hz+S8sRVGIeHhMXEFZsDH37vcdQhUR5kHYGezF++mLkSTjDREDVfZwmFz
 5lWjbBZHPm28MSU32tFt0Eot3QVp4hw6yvDvDqZIpTqcB/zGjuoITm9zIEZ9WVUiQ2Orl9vmG
 jSIkqsMh+0OVzHRNYF20NU6d1quFaFrEaLKAKRhEb+SC1++/EXTV5fAVlhr3U5W12oORtBoly
 Y5DSy/cOMIE/AoK1iGs3j4hq0dJ72q10HHt3xcEJZ3GPq4CJg2V2hEhvg3IGCFgt4dJ6fX+3V
 cHAlKe64SzOFc2GMa
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=h1xflFAB;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

ARRAY_SIZE is now part of cell-config.h, and the IOMMUs should declare
their type. Cosmetic changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c | 2 --
 recipes-jailhouse/jailhouse/files/nuc6cay.c            | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
index 8366d6b..bfd3aac 100644
--- a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
+++ b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>

-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay.c
index 7600745..c3b489c 100644
--- a/recipes-jailhouse/jailhouse/files/nuc6cay.c
+++ b/recipes-jailhouse/jailhouse/files/nuc6cay.c
@@ -36,8 +36,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>

-#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
@@ -70,10 +68,12 @@ struct {
 				.vtd_interrupt_limit = 256,
 				.iommu_units = {
 					{
+						.type = JAILHOUSE_IOMMU_INTEL,
 						.base = 0xfed64000,
 						.size = 0x1000,
 					},
 					{
+						.type = JAILHOUSE_IOMMU_INTEL,
 						.base = 0xfed65000,
 						.size = 0x1000,
 					},
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e2becf0cae127a8d87af01489fda95e258cc6dc.1586760835.git.jan.kiszka%40web.de.
