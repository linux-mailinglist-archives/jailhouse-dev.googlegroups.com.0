Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBB47VQ35QKGQEM5JKTVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FDD26BDB9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 09:12:52 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id y18sf484052wma.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 00:12:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600240371; cv=pass;
        d=google.com; s=arc-20160816;
        b=HeEdu1bUvX+FHLyMQ/mD3QzkXtCx2+EyirMnCwu8ymyM81JhIphRTsp1aHZU+M2+zn
         Kv6oH9eExtlylvRdRQA1+JAaYMcOEghJaL6TVrmsWLSPewo2Bn+Dk6Dc3evUuJm/vrTW
         38CyImJY9CD5WKaCEdiSrZuspnpzUW6qmVw9j4CzbD0+dkHZgbBg882MsM6JU/NodXFq
         Hz+SfhMvdkkQo6Vz/bZDT3S4UryUhg+NJgZOMGrPuQmSakJbNQ8+pNYvHJ3PE3ECbCXM
         w/0OEkHfWVB4Kb6uREu6bCn74bWdKQ59EtG/hYmtWPbQjJcuW/Ar2LM2naalO/4w6O4K
         D3NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:from:sender:dkim-signature;
        bh=3rz/WO9uCAD6GiwWfZIBKWUKyKoU8wlEwNY/26JlXjs=;
        b=xgDKHSuHQXob36HwsQhk7LbLtcw/77UhrJ8Y931J6ay6DNw9nkeY7M1Tf+84n22mGh
         ZHF2yfZu7TikekmIq1DCxQKCCxLq8/5b8toCC+2S2TYSZ4jwkMBorRJtbKtbdD4Ra/BU
         j/vX3qH1seHPUTnwt868ZL9mtFcBnSDUUCsIseu6GDWOXH+tGbc41cNbpMiH1y2tudSS
         U7pqCJNJKoDq7WgkUWdFhDOwqNplkL/Ws8EKKnWd7x3/2RC5eos1HK4BpcV6EzXKtq74
         iJ1JLMRZRGDKhShOYZ3uU+bhqaSmlg7pXyY/LsI60zqtnxd8FCAOoqY7aqb53SFwBaKn
         9a3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Y41rjbQ5;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:mime-version:subject:message-id:date:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3rz/WO9uCAD6GiwWfZIBKWUKyKoU8wlEwNY/26JlXjs=;
        b=ENk/IjKaiHEbN4RQBA3x9pkDdS8lIt9kIsewqRaSoCi+porITqBeWahcan16iqSWz9
         GByfwBxZBjt50IFWek4v/oFgklNQPhIvG2vEdCMEbwAaL2FgK+isNPqe9R6dWxqUsKzm
         QkMDGBuYa7fTm1rE4Bq9tnhSvvWhkejw4vtpCbZQnUdTMX/YfLhutt0McafZlzz07IXt
         gZO3+atOJmNq11WvfD7KudvOyt47m0KuG49ldVBURKqvKpmk3ugnivNBFTAO1S8f3oQ3
         rlzzUSGzkcg+lFwYEOQvkTPw9CKYgy7T7pwq03iaSZLGTsdSkNrbteRlPJxhEWUSt7gz
         YLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:mime-version:subject:message-id:date
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3rz/WO9uCAD6GiwWfZIBKWUKyKoU8wlEwNY/26JlXjs=;
        b=EHqr4C/ka4MVjhzofeQ9AFivyNIrvsO1/yIz791sY28hmynmd/WPzBBNt/nWfHzDAP
         KSq8Khif7/KjEQuqbwjH4bbH+ui8MnWHqzCfQOUS3MhQFFh/N5gRJDv7rnvW2J35EoK7
         QqKAuCgFLMk/vsNEHwvU7LOFOs6iH3k0h2lNp8kAYG9P7dXQHifmfN+6baTvnQbDYIOC
         IgM0BVvvn9jDttAtqA1lJV92t3VGthWdwCHzCIhGienixvaP7lcrQugng+cASLZCPKJF
         7Q/8fCImuQUwm8w6pds89XlfSoKFB6anOUxwYRiTxJ0GnrhunsXfV2SpQhTSJLNGsk0h
         qXJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qPWyQaQ0CMg0XZEoq2D7IvqQaF5VYYKYCZDYNSynl7EryduM1
	S7IRtkRNizix4ZbqYI8fVq4=
X-Google-Smtp-Source: ABdhPJzluCHsua9UtzI/CvugMwKO+O7WBe0f7ohN2mi42w7x1nqcDyimywQcAa+ZYEQBWZ/578J3wQ==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr26832976wru.363.1600240371749;
        Wed, 16 Sep 2020 00:12:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls1019227wrq.0.gmail; Wed, 16 Sep
 2020 00:12:50 -0700 (PDT)
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr25899623wrn.5.1600240370748;
        Wed, 16 Sep 2020 00:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600240370; cv=none;
        d=google.com; s=arc-20160816;
        b=jkYKqui/uwbW9rKoDvZDtR1tshnhgFeNkWWU2iSjlMgvu4+JecTnP+8jJAzcAFEFE5
         VTUpQry68taTBajcNCng58buRbAKzbE0+Idy8LIPQJmPPZFLIuE/K6OleLQaeWiEq8K1
         vrUWu6pq+XZ1VLu2NwRUyrraHjisuLqreSRlXWXpohHNX1I1GrK3gcGEfrNKFYvkkCHk
         LX7uZjw4dykbW6yiQQYqUj0NGE6cbsxP3iQe8XfJtqELuwoBMtOdsp7KSu9Q/tF2h7HJ
         3hlOi0PXXzXE6bC/0LoMWyetjXQGnKh+gwuNdxpqZW8fE3c9tLiLODzlTETC7e7FtP7o
         gJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=8vNY/mkh06e9nhYLqyB39iTLpS5NTfUp/AAwkYe1vB4=;
        b=jIyOeiZ8KuPi38PGwOoSwDhiOChqDXVCG55HEdWxWL48pTunpr7yrxIAvd4cg07iqN
         8iqPab7+hn5HEK7NRzLyFso73dORLrgG1Phh6hNqpc/YELET9Li8Q0T/nFYMiLJlsox+
         G8cOExm+H3tFdSacLK1q9Lqtyk6zRw8m3QizAospkHfwyKx8C/qrH6dgiI4m6pi4J0wc
         l4XLa3H5Cr2Ud6yLYOzPfVS1eg83T9MG/oCj9lqQh0iV5jGAfLGRGuK0AElMtnpp8Yl8
         rP0hXHgsOxyIrhztqkt9QgXEYpaWsu/EiKCxtzqTAdWJ/a8wkSOCRz13t0c01KhMsc8V
         OB6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Y41rjbQ5;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id z11si22928wrp.4.2020.09.16.00.12.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 00:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from meter.plexim.com ([212.126.163.234]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1kpn9k1XoY-00pJPF; Wed, 16
 Sep 2020 09:12:50 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: [PATCH] arm64: Make sure SMC calls don't have side effects
Message-Id: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
Date: Wed, 16 Sep 2020 09:12:49 +0200
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jan Kiszka <jan.kiszka@web.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:Wppw9VI0VVZrClyy5TyCjgHw/JOx37SG+mw4c7IUrZVt1Pa2riH
 KIJsWxJZkNJfu5YbcOpQGK6jokbQBjElkzbgaD2WEmv1awlV2Bu6/gusbi+/7caR+dgpOeD
 EwNDrLuX3nckIfNgFhqdcZMqkdVbwE35k6QcXLa/kaDPD87u9NKuQDQPjfq02m8ILZIKQYs
 x3Phim1tl6KMzjS24CD5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j4XrawEikLs=:/63ewd68XVFiJWX1E3binw
 SRcxyxPKuh+by6IJc2eW9fXQTCzVIobIjLKh76xQ95+f45GZg2C1fir0tshbsz4FiLQh3yild
 czmaaHMbJCYoR+DbhB5p+Rh38bdzHMSgkvXp1aJrS1FAZUO8WI9Ci7RNsolngdZALmtqLqSoP
 JG5AqH8nFlNXUW4OjszNpwpNh8LZotFUj6CLN3VMcPRpeig//qA5hi4I5xV1Ii2k8GqzI00Pj
 zOItSJE/q9F01IWgDi9eqZ2THQobOhqNPVEjkHrJZnHc7kpMty+BszYkjESI7xtfQUJTPV8M0
 dOJqWDp0dR9ZWw1B5BE/6sfc+YU9DTh4LRfGVFgnWFZWccyaX2b0NFSocgIDOQXyeUIZ14sal
 nAevJOTq8gHo/7DxqBAdRc7Enh3TvyZUjkKL3OopAG3zPAYzp2QI42CdoBS3oZcqEZZr2g8H1
 0PA+bFAaWIfWo0ygBmKT82ka3uCSSHj6v15MSZRjC4sNa+b9tW9UtrKFq8J5SJ0Mjs8SFjWXQ
 9cGLxJO9J/RATi3g01wao4AZVEyvKoIURU9xDHczpVlijKCx0DnrKrhC/D/av5WA8IdyULoP6
 OFbQuBDvHgP9T/Ery2MqrxP0A7KkFrz8XzIzdmjZzEpGi664quwOeR49YJM8GynUcRZAVGLr9
 KhH9HvmwCqRVJ1KhUM7WylLWCExCNdatcHtI7ONDTy8kwGX+rttKXgWXg87LOXyzkQC3QSebB
 Fkb6jDYE6Ir/QmZIwlTwggy1cemexv8NP4hmCKFaqsX5E3tiL5Tf/2ZYKmPAHabShMG54opdu
 o4cSDJWWXiQ4FShuUrFQHXJTeZjYXa0/rKQmIhWeWsKSIS+isW0/YLvIHz2g+fv9p1Zyztao7
 SC8aIDOnXIg2DyUoo8jbSmR47qqYXyHrqpbtAogVfYdMfsH0jQihKg6jviKF4P68qHIMgrl0d
 HHv/TNagpuutDuSW6vGtUqzLjLEltaEPrEXewgAZ2nup7Voe5IOS3v7LdCy7ZINAY4AEdmOCA
 MORdgKvFHo7AM9q7pCORfh9hJ00mHe0zx9iRCfbegGurgNkCZjI0i1yWG2J+ZX4jbMYSFl/dW
 93FyeXGFD257jMSu/E0SXOyNX1Sqw0rSKI1jUA3lhHoXkp/1u4HP8om02H1zVhD0GBImCZTCq
 3lYtLI1hbz99EOe23j7U8hiRjSNTIoFMmJfzWHzNDgQkSgMEEmz9aFEEwYNAlIjBv37jxbqtp
 3wOnKpmEGpnOR4FYesrxMQ8xiZsCvQWii70XKAQ==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=Y41rjbQ5;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

SMC calls may modify registers x0 to x3. To make sure the compiler doesn't
assume input registers to be constant, also mark these registers as output
when used as input.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
---
 hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include/asm/smc.h
index 1a5d5c8..e7b6723 100644
--- a/hypervisor/arch/arm64/include/asm/smc.h
+++ b/hypervisor/arch/arm64/include/asm/smc.h
@@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id, unsigned long par1)
 	register unsigned long __par1 asm("r1") = par1;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
+		: "=r" (__id), "=r"(__par1)
 		: "r"(__id), "r"(__par1)
 		: "memory", "x2", "x3");
 
@@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id, unsigned long par1,
 	register unsigned long __par2 asm("r2") = par2;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
+		: "=r" (__id), "=r"(__par1), "=r"(__par2)
 		: "r"(__id), "r"(__par1), "r"(__par2)
 		: "memory", "x3");
 
@@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id, unsigned long par1,
 	register unsigned long __par5 asm("r5") = par5;
 
 	asm volatile ("smc #0\n\t"
-		: "=r" (__id)
+		: "=r" (__id), "=r"(__par1), "=r"(__par2), "=r"(__par3)
 		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
 		  "r"(__par4), "r"(__par5)
 		: "memory");
-- 
2.7.4


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6B88A347-1633-47E4-A3CF-DC37738FED1E%40gmx.de.
