Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRG53D7QKGQEB5MWM2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6302EC5D8
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Jan 2021 22:42:29 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id i23sf5069293lfl.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Jan 2021 13:42:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609969349; cv=pass;
        d=google.com; s=arc-20160816;
        b=eIG2dQGxn0Jo5ZSEWpzY+mN7BZ8Z5daNkz1hnuyehDAMAIpUpxFkZi2nDixO3z7q6j
         V2VMXuLDhscSdw54SF25xroaqIbWywuSjzfdNHUS1FeDbRpNu/eafD4cobjF7+N+My3y
         hRuRtM6JaJktr4InvGn385RoJjQ8McqPxrw6a78eW1MBtm3PLfTZWbdj2rtYM4BLFLMz
         6Fyf6U6jryo0sgc4kz7+AI3dNAVqkvv/IUzObbcUrSuf9u0wVxrHG9L0bhIzXAg1vu+x
         7V5wXCUI6dgvW+bwLQezrzTsOx6IQOZruZ4QhKU1NJGJutc7AkzOgx8mUK/4Ug83NKFS
         LihA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=l5mht6ZB1NYS6CsL8Cr5BPTErhhzSZ0JlrdNJ6Ac0iY=;
        b=nqRlMmGuGJeH2+oOAGXt7lawiq7fEki9KfN8dVARI/D50kT8mYD+/vwCxqkKJTYMN0
         lhgV9VQFYD7uz01b4yrJPi8jQA1wDD99oJuSWQzuYhiAr88l9pkZElZDJFgdHZ6Anw/G
         WJ5GQihoANjhkAOYI9ouwf1koziUG+HB+s5I+SeJTE+fLYrbRufDZGPYykzxt5kOQT9z
         UbCe3+zyjY6hu9JrBUDZ/TX7qI4Xv4noGcPeSUMyygVwREGK6bK3EATjyL22oVfdspa6
         yNIZCyehX02zyRfou7H980FSaFV9TbO29xLW17URZv2ke2AM/nAM5itjyDEzUgGsa5vQ
         nIlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="XTKZWk/n";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=l5mht6ZB1NYS6CsL8Cr5BPTErhhzSZ0JlrdNJ6Ac0iY=;
        b=ZCvGafxtv1HI2PNoBmJFBjpEg3SAH2R3ackfM0ohIkZACdEo0CqMwT1H1aJA3fU5Qm
         LYsXeip260myAMIQto987zwa9CfizQqITLXMpSNJcKSvmr2p552tq0vdubRvnz+xX56S
         47ET03SgwTywhz8mapAWQVw391ux+aNeEY8FXu4slY/CvQakWhzKLB/5W16KDZ3Hpc4f
         7z0GSyLJfFIBxo12PBYqGV1A9AARgIb8fi8k/KSvZOyXVG6+4365Zdpi2cvKS/M/la0z
         t6FbNqDH+HxUstwAqGI/E5jTyBSBC+zjI6cCLU2zB2A9sAEFfOZ7ncxXGTtFXXJlFwBb
         qkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l5mht6ZB1NYS6CsL8Cr5BPTErhhzSZ0JlrdNJ6Ac0iY=;
        b=esQSB/bODCFM+nFYjHN4Mh7OJK6k8NyAH8WVTkWdWWZOgAn3jyZ3WixQn0gDoGSH1X
         bVEOT7qFH5+36npowKD/jOMAmYr7Up5NajjyaW5busvLEqyvUXCNCzILAMVIxyOiBtI+
         jZomPIK3ZfTxxA2QlZHxy6BIKpbL2rpWyexlbBABfk7a9kh4oPRfFO/bwirTc0AlyS19
         ZnY1OqcB3gGAwmn1mJX835mTFyuS4KFtJ7Ecz4hsqPa6WWDhECl39hpoyXDE/cmtdZHx
         vvx5iqq81OgAQ1DSUvLP5NDVhwXEXFIK0T9rYD4Tbaefm6gVkY6ZpNy+FdJ5lUeSAfoV
         nM4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533s55nJXqUwhDnNbf7eYuHTVWtQc45yZqxoyk177cKirsX0oLLv
	kBsxpINKwwFxFG7L9IgELjI=
X-Google-Smtp-Source: ABdhPJwaHS6+/hxYGJ1gO4d8zQrCk3er+NdrkVrse5VgogJ2ZgqgnsIwqpaOYVcv6f9yJHloGZaK7Q==
X-Received: by 2002:a05:6512:34c5:: with SMTP id w5mr2552216lfr.214.1609969349255;
        Wed, 06 Jan 2021 13:42:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10d4:: with SMTP id k20ls1035113lfg.3.gmail; Wed,
 06 Jan 2021 13:42:27 -0800 (PST)
X-Received: by 2002:a05:6512:2111:: with SMTP id q17mr2461825lfr.114.1609969347895;
        Wed, 06 Jan 2021 13:42:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609969347; cv=none;
        d=google.com; s=arc-20160816;
        b=Uzgz92Eb9JKc5c+tH1QMcIrceH/OP+gesGj/tBo4EF1U0EFwF4l/jPXyToZFXmW0Ef
         ns4dR4bX+v1IPi6pUjeOhHm3UYH2+YPZv2BEFePOZ3cEQ48eL0WyEK9/mvRehpD0dMF2
         SnFP8/BbqWzjSt1xut5aHxRMMdNOppKcfQXzoNeW3TZ5nljNQoN7x9MlMvNAYlm1pBk1
         P5tvnxIU7i7cORQ9rYRW1jktGRnonBDbQY4ChMcuYgeZT5/NqIjSPdpsZxSKhe3oldgF
         slRVv29RGwKDWViRuuvaC5Gk0o14e2c3vyIYr8ZHOasR1GwGGttJrcZ8NKoBs1jAXDnQ
         64GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=y01burMtGklkKQ81p0VtuRsqF5N8nn+H/FXVAXLMdaY=;
        b=PuCDpuF2GlZJHAtza/HU2bwZG42Dg4boq7zd9+nRtrvoGUpu8yz6JRR7CIY9jYDwvp
         R3C4i+/RBNXHdK2URiKq3CYKwk1zvazDPvcEw6HdDyEHxSaYPL6KUEU8mDZfEeFdUCZZ
         ZTFSMrJcTZwwjSgBHVM6qjJ2xPt/AKeOa99oFdqCO6vG/1/sLMMRfCpt6UXb8I+jCkeq
         5MxgbCmiWJyGnyr7q9pOcFgP7nGbVOiXWWbd46AazGL4xZVERdoD984eyMm4q3XlyJFZ
         /uF4TsKS3+9lPjVYGziE2WCbXOkjOyasV8hKrrQ+UM9ug93RpTZv7U8Te9pWEFkET7jg
         CiJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="XTKZWk/n";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id 7si157236lfp.13.2021.01.06.13.42.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 13:42:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MDPUT-1klPgc0od3-00GqCE for
 <jailhouse-dev@googlegroups.com>; Wed, 06 Jan 2021 22:42:27 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] driver: Fix x86 cr4 shadow update on errors
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <8f9713e2-a99c-5bc2-e75d-46cbad177c93@web.de>
Date: Wed, 6 Jan 2021 22:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:OrbjhIRkVGmXcnwFfjNUfcKMdVasnNalJPE6q1JXQFPKHOBo96j
 gDtHA2871DIyKlys12lpaBh2bSgaTGU9UL2tdj3SU/5pGSD1BQcYsAdve1WD7QNlrMihJjp
 u0bp3Ri5OdefSBN6drWm5jzhUTmZMoVaM27jcAtdq2Cs8bE76So2gkDYS1o6YmsWsi4pLe9
 LXsw+Ib5eyq4d4ziYcVUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rdLG7ejF1Y0=:/wno6UySoRNWQnmk6hT3b2
 i2RAuo27qcjzb8qGzn/Fby9P3HXsL3Nmjrx2TgEsVgiB7a4EUs4Yiz0P53i3Zf2MSHnQh328g
 dDPLO2DfyjLr2eYif4PkIAtGhNynNJdcYncC+a+QzjgwdMttSG8SmMmMN51aX9+KdtoDqxh9+
 uRaV3+eNMZQjuLR3mhkX3TJIPmH4lzkvJJIVC3LV1WGkvEW6K410v/0kxZiFB1wZfqvV+mmcD
 5rnJju7nvEdk5Y/FjroVAx3tRiZ4Q4e+nV8386jZF7eyzlJz5DBUU12QXBiuMdlLUjszNLKh3
 dqKhT/R+0NO+L9EVgrb9pGuQ8BocwXz1Yicv3qg2G+PHoWEqbQKUOCUdYfvdCuTQv5QSudoxO
 jHfPv6AYp7a7Xk1svmPLrtjmf8yPdLQkaxZDLwhBQGRVfFxoXUimwUvNN8+HKU5VPWDS21tmm
 gnBru5yTvXjuQSQfuWJ0I/69NDkac0f0YLwRshIE84kAtUdifpurazjvwYPV8WzvMIkFvhvOY
 psm5ceqBta2N40cz4b7sq5EAr18woc8vCSJanHVvKMvDOLz+8yYYR5nd56WlmEuEfF0bRVxGN
 ChRPBLpzvVigtvv6NNWPSP2ekDGMtzteLOKCjZtrBN7RYYG7SxZ1tIe2RGNVHdLez1MnHk1ru
 VLTNsAX/NhmxZZmt5SACGFTpvtvqiIVwBSaSOO9yG1n2TJkoNx4uFHwWr2f2XiIjoie6OIIzj
 +NDeeSTdzd7q3f/IONHgCgaicZyv1yIOaqKEANFNkgx3ps4Um2jtSBnTHxmduXEe/N/gFa5po
 gmX8/xrQHvRHnEsqIbmNRZxXTnBzchjsn2mn7XSIkpBYIpj/KjhbDcqLTVTDe5PaG0aZzc3DH
 m2SAu8chA39E+ZwytEuA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="XTKZWk/n";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

We must not touch the cr4 shadow if initialization or shutdown failed or
it gets out of sync and blocks re-enabling or even reboots.

Fixes: 67e4de38a3f8 ("driver: Adjust to kernel 5.8 and 5.9")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/driver/main.c b/driver/main.c
index 78af8e97..64e2b9a4 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -257,7 +257,7 @@ static void enter_hypervisor(void *info)

 #if defined(CONFIG_X86) && LINUX_VERSION_CODE >= KERNEL_VERSION(4,0,0)
 	/* on Intel, VMXE is now on - update the shadow */
-	if (boot_cpu_has(X86_FEATURE_VMX)) {
+	if (boot_cpu_has(X86_FEATURE_VMX) && !err) {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0)
 		cr4_set_bits_irqsoff(X86_CR4_VMXE);
 #else
@@ -666,7 +666,7 @@ static void leave_hypervisor(void *info)

 #if defined(CONFIG_X86) && LINUX_VERSION_CODE >= KERNEL_VERSION(4,0,0)
 	/* on Intel, VMXE is now off - update the shadow */
-	if (boot_cpu_has(X86_FEATURE_VMX)) {
+	if (boot_cpu_has(X86_FEATURE_VMX) && !err) {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0)
 		cr4_clear_bits_irqsoff(X86_CR4_VMXE);
 #else
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8f9713e2-a99c-5bc2-e75d-46cbad177c93%40web.de.
