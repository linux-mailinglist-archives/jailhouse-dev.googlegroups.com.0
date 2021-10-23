Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZ7HZ2FQMGQEADAXDSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79B43821F
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Oct 2021 09:04:08 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id z29-20020a195e5d000000b003fd437f0e07sf2868443lfi.20
        for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Oct 2021 00:04:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634972648; cv=pass;
        d=google.com; s=arc-20160816;
        b=HJ8HrmwQQv3iL5As8z7Pe4P+itPgTgz3wERTrnRNYPzYhJWQgapkFfQwI8Bwk32Q4a
         X+vSi4pyn0FezSymjbaSDH8x7+BiSX816LSjGPnAb7XlgAmmpno2BAtWscK/Dd3aIYkZ
         G9vLKo+GOaVAefXgcNCCFcEHFkOFPwFhgwNE+gdlTYdXor9si1Mmflx+JVI89E6lpGud
         nheUc5FJ1VSW+WJmU23GU6a4K58ttg0jFXTyOatOpv2bm8AZ9bpjVMLuUk8yxW7B47qi
         l4ZARLijsDktW0awUm6Ef4YPxcNFvVlDxnrEarjECouCa73gwE5gfOfgpLvvIHjF525N
         RqUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=zECL9V4FWl+iP8hWGI5PuZptclx2D/ktyZwWItlbC4k=;
        b=WHY647Z9NAWfIEc1WasUwB34SQxOTl/t3mmwuu0jRcYU5q1j0Rs8dx2JrfaZ75+03D
         bkEmIQuJuNH0LSGnH2vF2yd5VhqR3qIV6rkIrw7Br1Cnnzb5AT7654Ei3n4FZWCY1AZq
         bvt3OpiPIQtXY3LphNMcJx0anQ6snywCLa1oG0omEj37p7BH2Cd/V2rE364bZAEzbVTO
         1ZA9pVlagjkqc/hCUWJJTGhsQTL12qXP76H98SV31SleIBqpypOW0Jj+j7thhtqjf0mK
         NgRdaJI9+wj82KmwSmAgC5gCHYoa98ULFL5+KUtfTkpMO8dEh4JVDyiXAdjrp5d0Y1eF
         aOvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=APduNCcD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zECL9V4FWl+iP8hWGI5PuZptclx2D/ktyZwWItlbC4k=;
        b=svW1dr5bri4jD5ImOVYJ1QssChBSFo6dWPby/uekiSCx5Y8OlnDY5yXlZbqCVqZjrz
         XOVzwU0K/1OAmZYeOO0QTCRlp8HGKZf8tw29RatJ45exJIRgvLF7e1LEvdlX+JOrsX5H
         GOAyNn+Zd1eiMuh3W3ERhjsNU+65jd3kpqnrJvYaKFb6dIsSa9065XW5TMAl8MbxQNBO
         93QYmPYfJBHbAgkypuqOrdPjQ747M0sTevDfVmKdecynAFTogRv046YRQA0pTSjSNPtK
         M9xdkUYAq9c9LpsM0NSb4L01+tqZfI1LA42mfjU8r28Xl1kCz+wGckrmT6li33P7ZXv2
         aypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zECL9V4FWl+iP8hWGI5PuZptclx2D/ktyZwWItlbC4k=;
        b=C5lXyh6lZPhOB6PQJK0zjfnVBwFrt89Invytl5fS+f0orjd/cyYpd0AThxx09NkrX2
         RzYOoEk7YYkH5w1zKFNsfZJQAf2KgG/fsOUHDFv60AwNhjwR3cLabew0PXUC7CORvznf
         rJP5E6BCf7bqGebAGCNyTDyxQ26wRJOjMiYkTQMyM1yRQMDYx+2YeiAfmqTFG1qtK2qI
         +wXJRIgMzyXtTDb3o5UU0eGnFdFR90StYv1y6TLhI0uYLWviGpXZpC348IIePjEKUKZG
         pil80tAxYAjNL1XvbB474F4kTxmzpKzjCSaqfbheZelEn2F/TexICi/4bmbaNGkUYCEK
         9mBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oon/Gys5JH54fhU6Db6CNlzjIUQxDUjxCDqxHfpgVodX6M98u
	AphBlBc9HfdFVGvrkHtBRvI=
X-Google-Smtp-Source: ABdhPJwCQD6hhg4ra6T+CEyXyx5hkWWwyodiwm+J9J4mr1paqytC/JNA7eXLUPnIjJwSjsWvSVhVQg==
X-Received: by 2002:a2e:a4a3:: with SMTP id g3mr4808766ljm.170.1634972647901;
        Sat, 23 Oct 2021 00:04:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b8cb:: with SMTP id s11ls100875ljp.8.gmail; Sat, 23 Oct
 2021 00:04:07 -0700 (PDT)
X-Received: by 2002:a05:651c:2107:: with SMTP id a7mr4955131ljq.435.1634972646930;
        Sat, 23 Oct 2021 00:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634972646; cv=none;
        d=google.com; s=arc-20160816;
        b=Rlwxyd41cljgouqZR6fSreGnp0fX/vArI9vZp6vvqOgxt6ycRjgW3ctpIkUTNjJAse
         Jr8KUAZX6awlHnm1Jgg4r0FsY54IhQJVwFA/AhLujouembvpXZJ1fq7endgvKOnFRLat
         D/IrfWSOQOw+5BvSE6rhakxy3abcXg87f1tq9D0yo7ggh2TtZl+04caL2IGNzA2qdA3b
         yz0VwPGrbWVNgw3LTCMPMDiW/3WyKwV5QR/tLQ71fSrarhOMCJRyZr8n1ApWU+09Wlf9
         tQXEf1x68e8bMj3yzyY7evt0J6dG3WoPTMWqC0KQAiBMGgQOW3QsBFW6rJQU1Z/PmXGL
         srTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=rvoNySJwKqh4syG8SqhM3Ho3tXBZ5LVygSbdslmstps=;
        b=ckFu74G4IXvJrL4DMh8ydqZPGA7H1DsondsIomD4hhJgpTibI/H5I1KabL3ATuuz0/
         VnZkjG1T+qrumH2x6sxnppbdRnI4E9ichScYYVtS3eUxXIufEEMRrvo39ON8yiVyDoek
         XlF8+I75Ynz4JR9je0EfrG0Ov/SkSile2NvD587NRC+O/5GgKUfODb3xNHt+agSU95H+
         0+wPsLWDjmMAshb/1mfSbds0X1icxqo9IkVhSiPUEWSwJFXkcQehziuhCp6GbBMzIfik
         qTPpFsoxGgaGaYNJfOxaKwsbxHsV9OMMQXTgHB22Ip867j1EFMuxijhoHX4arAoil4Zx
         LX0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=APduNCcD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id o25si614685lfo.9.2021.10.23.00.04.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 00:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6pYS-1mcWNs0kxS-008Yu6; Sat, 23
 Oct 2021 09:04:06 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [jailhouse-images][PATCH] crosstool-ng: Fix build by adding patch for
 new isl mirror
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Paul <paulwuertz@posteo.de>
Message-ID: <90905e1e-4614-89c5-ed1d-aedb415b0e77@web.de>
Date: Sat, 23 Oct 2021 09:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:/ESYF00K6MAQQeVOAjHzwWQZE36AfPWtJGuc8niEkVsiOiD2NcD
 PqMAnCOyQmNVD2RkDkUpufpVZ72gUN9KlaXYtWqqNacn/WpthPFhljBpFLE5MNcQ4tJHtfx
 Eg74rb6bBdKJB5CldTftFoGDAGBJ2Tg3AhuADogRxlx5JIz7Rc2+UKNHyew/bj1+t8Q0CEz
 fJ2Bj8U8LVsKMSEbOxptw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sd/TuJAstrY=:W/pkec4LiAv24jGlz3/K8K
 HHSXREHgqybvY2o4HRp5vFDHrj03AUVbqA90AAkcNz5yC3QciWibHo8qXq846gOTKPLJLPYaf
 5CKcycpEnODgdeHCy1N5JemNYfc3loyiMSW1tRFPEbF8P58z3BBr3hGioIF4Q0x0p129SX3vR
 QkvSTd14MCtsEUwO4v8VEnT9FEZKbcRFzXgbUa5OotsPo62xm4fQIPyMYBf3skbxrO+WIb2TJ
 9eA1VfqP12EihekxSrHVDkFn12WA0wL/E1rNP8WBrWTDL3MwYtVjh61SYU+TwrIR+r8Boe7qD
 lSGK4IwRid9+jQREqM9tYoJENWXLzk7Pvt30w+BkyHkql7s4+0HeE+w/1YlZmx4X8zAZmLcxd
 8z1C5i9svq+KbP0xeZRPIzlhTgwWxruekQWydr3JZMUoZwQmJW7Yo/zBIagnwBNgAyaOSWwGy
 Lc0MazqiRxPyrvntu77SDx2HphVT9FjvEt3wfWr/s4tJ7TK+xRNc0fQpSjKs2dcq4bWTQYYbp
 DbElIJStrSHDUACiU39OwlWk6uSpbuUUAtzNbvl50415km+veG1mK7m/3FIaZTnisYN1NcOUa
 AAH/zxzG8rXNR3/ArQy3dUg+nAhup8OYW+H15DOmYvWHn6G+b/2nIZGv+VCijUSGUf0tDZxlB
 QTyur7Dm2zbyKpA+1iaZsSg55cI3+DKxhY4T6keAecMuwtco8bBRYSLTNJCFhQ436PGh9NqdR
 ACULCFl4Qgj8yc9vTXZNvfRxzu+/aT+xZAS6ZhGg0g2eX9aqhZWoHH78Nb8YSyGOAMMy4eTok
 8BbGglxR1/XkfxdRM5d24Veiokf31x0y0umB/RVLSV9+eZnWTPmW8iITHtSkiZ/uKUdyV1u5r
 TptJsTOXpJUPTvZwtfWuVjU0wyXL9jv7Ru+uwVh/iA8Les1CH0XLHe8b3zaeyNd2T+OT0sDV6
 6Yp/K8+u69gKdMSvvKY4wDc8c4YtQYJjZwSq37TznmQFBPyJi8d2PBBdJX7GjBPpuCR8tUZVs
 Pt5ZF2htFutZQQG8cfbZsiOn/UpQRPle3fKQkLux9FQetbrubTmyKCNYDhZ2EaPCG6ShbyAqw
 LQj7AzS7wN6wp4=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=APduNCcD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

Cherry-picked from crosstool-ng master.

Reported-by: Paul <paulwuertz@posteo.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../crosstool-ng-microblaze_1.24.0.bb         |  1 +
 .../files/0001-isl-Update-mirror-URL.patch    | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/0001-isl-Update-mirror-URL.patch

diff --git a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
index 84b612b..ae339b4 100644
--- a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
+++ b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
@@ -15,6 +15,7 @@ DESCRIPTION = "Microblaze toolchain built by crosstool-ng"

 SRC_URI = " \
     https://github.com/crosstool-ng/crosstool-ng/archive/crosstool-ng-${PV}.tar.gz \
+    file://0001-isl-Update-mirror-URL.patch \
     file://debian/ \
     file://defconfig"
 SRC_URI[sha256sum] = "36c0067a2da265aa88f8d91c1647d152c98a100b8e2ce416cf47dedf08c069e9"
diff --git a/recipes-devtools/crosstool-ng-microblaze/files/0001-isl-Update-mirror-URL.patch b/recipes-devtools/crosstool-ng-microblaze/files/0001-isl-Update-mirror-URL.patch
new file mode 100644
index 0000000..73b05d9
--- /dev/null
+++ b/recipes-devtools/crosstool-ng-microblaze/files/0001-isl-Update-mirror-URL.patch
@@ -0,0 +1,28 @@
+From cfb7d07ae1e0ef4dbf14f40a5744d1abd382d000 Mon Sep 17 00:00:00 2001
+From: Chris Packham <judge.packham@gmail.com>
+Date: Sun, 10 Oct 2021 21:27:50 +1300
+Subject: [PATCH] isl: Update mirror URL
+
+gforge.inria.fr has been shutdown. The isl project has moved hosting to
+sourceforge.io. Update the mirror accordingly.
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+---
+ packages/isl/package.desc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/packages/isl/package.desc b/packages/isl/package.desc
+index ffae478d..20f7e024 100644
+--- a/packages/isl/package.desc
++++ b/packages/isl/package.desc
+@@ -1,6 +1,6 @@
+ repository='git git://repo.or.cz/isl.git'
+ bootstrap='./autogen.sh'
+-mirrors='http://isl.gforge.inria.fr'
++mirrors='https://libisl.sourceforge.io'
+ relevantpattern='*.*|.'
+ milestones='0.12 0.13 0.14 0.15 0.18'
+ archive_formats='.tar.xz .tar.bz2 .tar.gz'
+--
+2.31.1
+
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/90905e1e-4614-89c5-ed1d-aedb415b0e77%40web.de.
