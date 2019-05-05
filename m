Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBF7JXLTAKGQEIMNWSGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA113EB2
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:02:00 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id u23sf251462lfg.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:02:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557050519; cv=pass;
        d=google.com; s=arc-20160816;
        b=HJ4zZHIZYY3dryslKl4ZXiIH2wgOgumZbVMaejoZNhIcLYoI9mn/DMAE5P3KOyQkih
         ucdbUARhPjETnK2AYdCGwFHhweRV7+uLwLujFuKkl8kXnuT/BoqFhGCZ7Pkzq6bImac4
         /1k3Yk9tOHM7SehYl1pX0ZXPJG49x2GlSzxSolCz0z1zGi9E+djqe4Bwy5jynNzzlgxP
         GvZMDU6ql4NzAPb5gbSvZ9Yev33L2xZdXFhdue8zNqMJ/yAe05tmnARfz8RMMnW598ZS
         pWGNOCyDwv/TGSAjBO7U4Uw7Bpvt3je05ygrkasoywhOqsyIPitIal7avYiEKUi7q54D
         n5yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=a3ZlEi+VOl3a8N2IEI2D/xFyUfdywjIshjqMSOdlTh0=;
        b=WMzPkcxA74dAKtueSru8Zau0D5SlB0d2436+CbHJBb57ETC5se+ECtqUmw/TxGOel2
         95SN6aJIn2/cxvOr6u5uk8hN8bQAEtPnzi4XlX1iUfMb5iCmxEAiBAahc93nRgrRvhB3
         FgD8eVNpJBmllI3xrlusO6H6qJhVDvmPCSZI25+NGQFR2xDRNKQD2AX7ypcQ8YHrhssN
         hhSigp+MfqahCMbUbfiKc/4VvLvxy8/NcEhhFGhD866M37uBZdEZM20mfdXaysqgiLfG
         5MDimLTUsGwic7RphYXUaii3MrygqBa+YT4bb7Y1fuXhJvS+Ctlor2aL/e6mFGlHsBLi
         10gQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ClAIQFQp;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=a3ZlEi+VOl3a8N2IEI2D/xFyUfdywjIshjqMSOdlTh0=;
        b=OKlIRTG+0o0gNydqnTHli6H0m15NLI4muFbEuVpCMH97Ta+0UkB8Llj60Q8SrRJwHf
         JL9eRBSfrrygCf6/UxnmEV8Bxy7hqMfJsivCsXeQYtONzkqWu3fUsBapmj5zn1HHJQ0q
         KG2DmIwd9zZlkULcaQWbk6Tw8ru6CvBW+kptIEjfvA+YtXbCWPZ3L5qcvHvEWv/grhC1
         6RT+NZNc6YnftcTJ1wC05rtVU0hP68iUcQFe1RDV98m4XFeWEr4rNt/fudnEjHoCJ/Ry
         GPu5ZWRBTrDNjF/phL51dII9X65rtXKo8t47AIzrs1Q7VGYXaA2JQX4TRW9RwA/ubPB+
         u5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a3ZlEi+VOl3a8N2IEI2D/xFyUfdywjIshjqMSOdlTh0=;
        b=m5MN2yUc32TwHfBbphdQImZG40QcaKAyLSir2fwHAcgO2/uZEHauNQ0jyzOAWJSF3R
         fCrddS3fu0ya/G7Fwxkd5JWx8G6WAX0tAvIKe/bbG2UGBsQKujvNMvRubVupV6Qji774
         swhV10VPszFWfqFH3owDzjW5neWfZ64LIm+HxOW2Pi0slYIyfk2mJNpCOnH6FC+Xek92
         oPopqHUy6ZQrjQtrg7/yeHQ1zCEe9COjdWKo7fUloVM52pfEKS9KlDlOn2TpYYKAtTXm
         XpRwcW4wa6jkKQPdjCJGJf1cxtoO4B7BKvHjNhRnvFfkO8/r3LaLuWe/Ge6Rix9uYJWD
         6eNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXWpW2DpTcLpObXM6pnxCf37biGPyFaGLdiOQUEdF8uobmc/OW7
	PTQNtFu6sg/yySONTlbwe3U=
X-Google-Smtp-Source: APXvYqzdTzW0q7aZNjldv7XprBRabNAwCPPic81QwRPVbHqUo3l0JyOmMJY6+2+kchCTagGr4IJEIg==
X-Received: by 2002:ac2:554a:: with SMTP id l10mr9010401lfk.45.1557050519859;
        Sun, 05 May 2019 03:01:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:1d4d:: with SMTP id d74ls494280lfd.9.gmail; Sun, 05 May
 2019 03:01:59 -0700 (PDT)
X-Received: by 2002:ac2:5934:: with SMTP id v20mr1191868lfi.4.1557050519239;
        Sun, 05 May 2019 03:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557050519; cv=none;
        d=google.com; s=arc-20160816;
        b=cAdtz94Cb6uH87uTmOMm2o1IcEggCa5e6bxZLHfeAQ3liiuTJZ7ecWHlQWIs1FjTC4
         F5pT8LpJmNC2C1tVwyqo9YoNNwM/6W4OeSkH99IENlRnL1Ta5OOYQzLC/OVhLgc3iQjO
         VSvOiOpiwp1t0hPE2eYZmLtITi+lKUsNsdR8SgC+T4arP+7Cw99AxwGuPdXAwOD5TUFl
         0vXyh7pSIqELez0TbZUXEtmXJmWOTWVtQAveatRe/MZmIWmDXgKpvamHqncJXKuPPHhW
         /5NjwCqVS6pf294u/xfRW8mvUWSUwDLPEkQdUJtNwhpLG7bROD3lYF1HG2w50IxB6IIh
         GIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=/UYk2/Sel1QTVItWRpYHuVAm1FET2Id4a12I2snN+AI=;
        b=K+nz6r6KFjUdaOLJeyyGMailnayOx8qRnrgqENyfoggiCEi+2NfmjW0i45FFm+duis
         Avm4WG4W9xoBkCDyTP6EW5g79gqAPd/xpAyF+8EE8RhOPGWtxgWgjdIFl3L+HEaA/DOv
         FYdBXoXsJvBBPrVf/6HrJV3L8AnjEFS7+BfVNPErDYLVnh3hssK+xw6/W5lxyMn8pjDq
         74AKYgQMrCTWoaXJjHYa6cX8Fm4LHgXyd+v9vp7ARt3ybBoHio+CrW8BtYpM1z5WI053
         vWgQpmr0yJIAyDthxlgB0gTt1GbBvhUsz9yQQJp3zmdr427CAanNoa09HF194o9IZRrC
         WAjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ClAIQFQp;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id f18si39770ljg.3.2019.05.05.03.01.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MHGJ1-1ha6Gz1oUl-00E4FJ for
 <jailhouse-dev@googlegroups.com>; Sun, 05 May 2019 12:01:58 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] README: Link cosmetics
Message-ID: <175f0954-e722-dcf4-9558-9165aa6abf9d@web.de>
Date: Sun, 5 May 2019 12:01:57 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:fqhPE+sHACrkpZV0SMY0k3J56in7ydrTAa1vTbzy9tjiesc9+zL
 ooLrAukCzjAlhyqjw/q08ac1AhfxfjO0KK7Saf0gV2qtgi95hMjiapnBZ8XL8osafRh8R5b
 jCH36RcRYH/uzHaDnLbpCRb0lZbzWZ9e6ZcbiF/u2g5bdCZkjdvQ1p/dKsYKB3hA/TkouTQ
 X9QRONXTeEvxIvpELCkbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KkdYgl7IcLQ=:QEwywaeYcFoOzCIzuQcgfr
 nQvnOilJZYdY02mF2ToSim6DC9LUXowa7A7d7JTsmfIM3v+R86HOa+pbaj/s68ipfd6XaxSW8
 R/2lte1NyJKwOsTINxupib7xn5czAQ1X+7Pkn0eVpvoE/Fm4ifLdJw9GXo/W6QgbRutX76y4n
 mzgqxm9MOd6SaJbdH5mGSuT4FVyvAg5i/zPicibU0C/IBgHMLKk1OO+kwIodZPS8CMTeuoy1H
 DkoJefJsEpTaV/bsWv595SYgKLDtbQXJRX2QwGE9srs1surSF8HqMtBjftlQZMdpH26a1aSE9
 DkH50Nwfb52gc1PdYW8G9/Kgz6t3FE/YKqIoCaYheep5y6SKPK9K7M4MnCM19Fzzi67tGLxhJ
 HuPRA5Pagxe4O5ntdiCjHfvcNtUtQxJ1AutsTaGpdtUrsDqIoivXz9BiiagBZsahDRIB6EoE5
 o5MyAY4/WtrUFtZbks2923/CgR6HrCZTyB4C73CC7+hb46J0bNiHBm/1e/4ln4fcjTJwtfl5b
 VcsFkqAwq/YThtAuf7KFA7yROQMba2K8KBM6yddHNp2lF9ZG7JxMdGeCO3AWxLRhNdCQVbGIT
 pXkBJYtgLH6mH4mciyxlkfCSXUtMSCYE5YmpuRrBhBE8MAIJBmhNzxkST3gJQNfR3Eh2f+39I
 XZHYJ8lX54mUdVqRrtMqtGkNucPlHV5/2QQONO64CUNB3dqC1GASlU+QQSLAF52TJanMyqS+n
 fpOtDKZXQu2XccBLGtd+Mfk7LKmDzk6NtW7EO4JHMJKjsj2dmeTzYUr7HlFmb1JKyNCPpQ7ox
 q07eyyYdZLSNivaOkXHF7ZU225KlYU0KB8logxwR3ubVVce+flVnrRECz/Ld/aDNjoqMqvnRZ
 TU4uEUznu2gBiKbRqcgMuv11+FMDKvYQbdRPL0fP19hNxUj6K2D31Htzj8N89gULU7j7ivyy1
 yqxbX+hJ7xA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ClAIQFQp;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

- gmane's web interface is dead, propose mail-archive.com instead
- use clear-text project name with coverity

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index 5f82864e..a1c2f986 100644
--- a/README.md
+++ b/README.md
@@ -61,7 +61,7 @@ Mailing list:

   - Archives
     - https://groups.google.com/forum/#!forum/jailhouse-dev
-    - http://news.gmane.org/gmane.linux.jailhouse
+    - https://www.mail-archive.com/jailhouse-dev@googlegroups.com

 Continuous integration:

@@ -73,10 +73,10 @@ Continuous integration:

 Static code analysis:

-  - https://scan.coverity.com/projects/4114
+  - https://scan.coverity.com/projects/siemens-jailhouse

   - Status:
-    - ![](https://scan.coverity.com/projects/4114/badge.svg) on coverity_scan
+    - ![](https://scan.coverity.com/projects/siemens-jailhouse/badge.svg) on coverity_scan

 See the [contribution documentation](CONTRIBUTING.md) for details
 on how to write Jailhouse patches and propose them for upstream integration.
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
