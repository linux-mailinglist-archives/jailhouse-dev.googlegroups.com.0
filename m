Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBL5M7KFQMGQEZU3UHKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA21440E93
	for <lists+jailhouse-dev@lfdr.de>; Sun, 31 Oct 2021 14:12:17 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id z2-20020a254c02000000b005b68ef4fe24sf22031340yba.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 31 Oct 2021 06:12:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1635685936; cv=pass;
        d=google.com; s=arc-20160816;
        b=jsqOn5CbMFFq5mswSdqwzVMnbrHovBorVVe3iYe2oHhLBtd6MdfCMky0yOuxeJGEEk
         K9wPbISJ15iJBJke3mRd7aDEd+pBtMEMZZhOAfImLBMf7G4FpZfvfnDaZ5pyJpShqDHe
         bDNbD9wNjzvYOJ1UNlckWl1MvdQ3hd0rEiGhbV3NCXkndXn6piHM0YxAzxOmjSan125p
         azswxUyE/k8N8BHg7Iz2rY3N/CjlMd5zGAtbezo/Bor7dfHIrHcLHcTc1vHDG+LvGrjL
         3oPwduIXNfaG8Wb7X2H/rbe1besVwxlrhXA2V307hr+0kv/X/ZWVG7DcZIpu83/V7Ig+
         XgxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=RZoeuWR0yuG14Ui0oyty6A34B+wv3PlC0CGPP5A0TlU=;
        b=YTyNa+hYKrSCcKOGs0uKJet4OfPUGgPyutgDz0jKYvOprXs+qdqxSjsJ7wQ6ayRsXz
         lMua1xHEX5sjICrkX5MqK5cYOOZ5X5F5yONeL621YcA+MPx3Me9k+HYPg6mhTIZsC0za
         yInntgLE/5SJH0vU0QtqNq4CF6hwsclvmV6zYM8v2hQ+CYVkzwCmZrZjSrIEJ0WqxV2e
         Jmkg0i6QuCZLiZBs09IiIUaIa8h4VI9QXEYVA34J/XdPRwC9YC3JtiorMzDTYOqB9wIr
         GGUP+fXCefgxYDvWt+4rn4z+R3zO45J9tjYwejy6kXJmZ8abQ7bEue8vEdjklBJy+Oe6
         rYIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YXGcf7RV;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RZoeuWR0yuG14Ui0oyty6A34B+wv3PlC0CGPP5A0TlU=;
        b=prtRFqiXxMMq++h5ET0e+s7kUGPFHIRDyg5ovGjDUsQGXyCH4FUHtuU6//i6yC2Faq
         f2VxcGBA1yyN42jFiX494l3iW/2mGlfxjA66joHn+ofdfIDdbLMj4hJC0tR2d0sQS1b3
         rLMZCj2FXANVUaSyDzeDHm1JIKX9YPy914YEx2XJjWPcvuis/HHq0CgbYJz8HUlAnO2e
         jMppE7/10xBsCU6+vSlB6l49gx6fC8oFoQd5gHMqVcv+84zJas07HqavvY9xZQKgp2Py
         sdM+p53ex+E01Z4lXO4favz+cEczyPWwn0+XiGZsAUly3N4iJAIGK4WZa0t3tVk/6bOO
         yFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RZoeuWR0yuG14Ui0oyty6A34B+wv3PlC0CGPP5A0TlU=;
        b=KVTO3Jqg4FC7zPxjAyTLMathj+Mh7FFK03uSbM7nFUC157QOf+STDskaBFeqgkdci+
         m1aR6XvXNkd/16XiCFEWuGu//bvZIEPMZeCTcbH2PHGtwpivWiqksMPqUaB0dqaxJLt2
         tQfKJ6Zevc29WbpMAVHspOHFAJuYEzIO4r1EUwL7MusU6VxD6WHoBzx1K8bu6X2tKmw9
         Z1Up0bGSVr1j50HQeGSVENJln6b8J2YEjygbwZ9X5XlcD0Ws97CbTO6OAKWaS/77vteb
         g4IO0vwZC2yINfPil8cINGm/pgS1ND75Y+xAeruivquLRzQ7kKWZq38ZW2o6wFQCkjZp
         ZLJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ta2ncP6zzPT4KpAgwAMb1l/M5XC9R7JFwwsCzy8smwcJ/jEU8
	uPc0sluKXPxYMIV/uP2x4bY=
X-Google-Smtp-Source: ABdhPJwb2cb5ZWoFL4C/dnllaNytxHMTmrh5PDq/ttrLMwzZ0TZldK6zv/ZVTa28zxQOJi6J9rgaRg==
X-Received: by 2002:a5b:786:: with SMTP id b6mr25240032ybq.112.1635685936113;
        Sun, 31 Oct 2021 06:12:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:38d5:: with SMTP id f204ls8051923yba.2.gmail; Sun, 31
 Oct 2021 06:12:15 -0700 (PDT)
X-Received: by 2002:a05:6902:114c:: with SMTP id p12mr28056960ybu.408.1635685935634;
        Sun, 31 Oct 2021 06:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635685935; cv=none;
        d=google.com; s=arc-20160816;
        b=eb9rkRxYK7z9A8zIwLa2OmO+19ZZHrmDcpAaxdm2j+N3cvCjPZkpEifzaICRAty6RD
         gXNBORPYxmZ9TXiVyIh7cDnfpgP5H63tsCJg2gG3Q9A3DJx4dTtehVeIiNf1Qi7PIkt2
         VpWR4EoROqF89GKKv2A02fhbjCID2vgylWpsi1s2TdkylM33vCisdW7DYPqpO1uZq6GW
         W9YdnhgSHjUAtwgm0Vf5jTTAYgK4NsgP8aGGsReqlOciwSyhdO4fdIoyGDXGvZwjNK7I
         ehM6Az+03T+ptD4L+dmKpZJ58B0dTLKotGWC/TRQBuf+LnQ5SjdqitTAWskGVF6QCt6O
         B0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=U2m15b8gcAdFBhzPAIkXvtfXw+xioUWGTRBBE3u1Jyc=;
        b=md0+x7cLbKH02/dATtXFZfO08J38IUBjq02ngYUXirJ2/e6w1IuDy3JmU6YzxCJug/
         tvgOUjzDYEMq5rwGyES/8WbZ7sWQBpFqzTT58ngsfvQRf6krKMRDv8wqXAHtjEa1sQhY
         teudYQlQbDlNu0C2Wa7i3be9ZkmVItbOxLDpT3mDXMTCeq8jThvCu7rHjUvsFOAtDUEU
         PuG6yORr1svJaVVg38x2QDW8qT1fHe/zuGhl9HKsSCPjnFyfUE++6hy8XUKL9+8YxIok
         /8cMJYabnyNCPKGAmXs8iFNuRGN/u40+KLVj/PnGnA+Ce0ndyLonB4sVP3bhsUTiibfZ
         8INQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YXGcf7RV;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o13si1058066ybu.3.2021.10.31.06.12.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 06:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N62uQ-1mjKP018iu-016VDj for
 <jailhouse-dev@googlegroups.com>; Sun, 31 Oct 2021 14:12:14 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] ci: Update package database before installing dependencies
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <9824fac9-632e-d28b-937b-a82854761001@web.de>
Date: Sun, 31 Oct 2021 14:12:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:hB/CV+bEL0hcaHye7etbHBH66mNDG9SKAsDOVz67m2TiAggC7BN
 SbXSTALR8Pzr33Js6NRXcSd1kduxkichzo+UzSlFzEPf4jfM1TiIkDhA7MpPHKaSlowYIJV
 9sGch/gULCKp30uaXWisKsLhXPRQT0iQ58hG+X/OIE3102dnyyY1Abw2aKylQq2rfsvWKU+
 jc9gTwVwnIhTabNkHFjRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E79Sqz5A18I=:aIhMPYJHkOvucVbEFvuwfJ
 WYqkQKinmdV1uCTcsPE2qVaim5fhVhD+6elq44vuRdrv4H14QQSf0YEB4KrHkOiUpZAwgBz9M
 TGDHrV1DODE5s6jSKV9VGYGrtFcWRbf+hzYqS7ubQANNM0kVmUMCAmzkGJCAIx8WgJoy72jK/
 zveCZxOqsO9dzMhPkS5Qb/TZasBXt384t4QFje3bj901GMipQmsZuH08676buZw1W4p0rwOMX
 PHKl0+Q3NSQeXln9xm9kUujEzrzSQDxI5fTHxpsHOCPXOKYTPytbw7xga/q0IHKBZ1G+7RBto
 VIc1er8tboED+mfdhOvvGr/9G/9UH03oNm/5blm9c9A7CWpDocV1xVztS8JlfI1P8mevNu03U
 voLeHWy0GMta9BYtZoYMP69yK6gUq1k0bDLgIk5O9Mu3/JUY1FpXsjDRJZcsK6/hIRngvQ9N5
 45NLhIXAPwxLWqZ1G6rk6kv+NqBcxvhrgirvOS99wzOD56b3Fmmkpfaw8Iyl22IF2DlGM4ukv
 XwTxMjh15NDIlHpXY7JtzGLlJOoAy5GAo2w5noW/iniQOg/cMl5N5rNg6aGhnNTc35BViHDCK
 frFwThl+43Ok5M8wWpr3hBR9x5W93ZBrW+YRcFZcPuzSFlVlcdGsUqNFQw3BoQEnO8TgD8trS
 TnpOCRISGRz5JhZEFHvMRtO13j9E52Je7ieyP+wnxN0nQeuD7wCawMu1kM10yC/l2rfIkl757
 QDEyreWoxVIOjK4CChEi9cgaM6edOqdr3bvldVnJE8Llg3ZTThf9ZB74Wnh3mSA89VfcID0gE
 VcePNIuJ2qMNSq2Fh5ceJj/wXSp0MxbdNT43aP436PwzfyObyLHhGo/gcBVGr21djQR3obS9o
 xajvPBaY1gJFs27xAKTHxYCyw+421A52eeJHYufToubEhUveiK9bWqgqgmDrZgI6KSFNibKQJ
 BKGWPQ6gBFsHqYXCzer8/SbYnj9Q9cZMXtNZ1BDgCwqOQLHBQ4zbVz5ojdnTsz59qNccvtTB4
 bxp+2pxCQK1+9KZfz7wpPklECF4GB/CCqxtsPzrMfRBUYtofEho4kX+gVzOGsWkoeQp5x8hCp
 oUncFwcuSzRY5s=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YXGcf7RV;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Needed in case the repo was updated after the image has been created.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .github/workflows/main.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/main.yaml b/.github/workflows/main.yaml
index 18f2891e..1dbbc648 100644
--- a/.github/workflows/main.yaml
+++ b/.github/workflows/main.yaml
@@ -29,6 +29,7 @@ jobs:
         uses: actions/checkout@v2
       - name: Install dependencies
         run: |
+          sudo apt-get update
           sudo apt-get install --no-install-recommends \
               python3-mako gcc-arm-linux-gnueabihf libc6-dev-armhf-cross \
               gcc-aarch64-linux-gnu libc6-dev-arm64-cross
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9824fac9-632e-d28b-937b-a82854761001%40web.de.
