Return-Path: <jailhouse-dev+bncBD77HX7KWYMBBL73YKFQMGQESXZQJ6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF1435810
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 Oct 2021 03:09:04 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id y12-20020a056000168c00b00160da4de2c7sf10704378wrd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Oct 2021 18:09:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634778544; cv=pass;
        d=google.com; s=arc-20160816;
        b=Aox/LWaiy74p+GH6mM23/OD3Rv87S/DtMXWbLcgxhJQ5AtVo9Cst2gWo91oY35FmZA
         eo6FxjNqYqQcZgjU1pzFDEXC1VEiXQ7c5nHE9Ip4xrGyg7G7xJjKZT16FqOr1+bfXOgO
         zNECLVgywvktLiu9744kuIncIwDHlQIH0SgKyY5NeAXEfTGxxN+q7U/jcJd4DO1Og6/F
         mJGptu7MUtOMO20xs/aBkUzzTM2Ew4dZNf/GG2gD+bYrm1BdQRkKuhF/5qA6ChQx93Fb
         CFqVE3Q6Nlsyc+LyYRLViiFpLymm4nk3QX1QvR1jjuQXwwQ+S3+S+djX1A3f4nV6ea6v
         P3ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version:date
         :message-id:subject:from:to:sender:dkim-signature;
        bh=sS9kFYpZV1Vj5nPi4kGF4rrtBPfoPN2ZrTL0fwaQzN4=;
        b=oPe/EckmoZxI6P37eTYTCDolL6UI60k11GtHNRXULN3V6IEK/nc7e/M3+zGC1HFDMb
         XwlXNC58ULvOHAC1AXzqaGwRlTwX72VQ8Ml/DscY3qQ9YFD3n8OEGL6Pt3sf0os3tHVO
         8/YWJGjWEVb6xELmF0Ki2qHPDAs+5Px77UoEzXJpUTubKpKMCWaQurmYJrIYrrwBYIvk
         LFKgTGeGuJL89PInvkYQtmY2Yr6WkMjmY5CFVR9q69nJRr2o3pibMmZ/U5zFgMbs15uI
         zARhnTXCNNZGOTl1jFjFtdeKehJs6wNafFZDdx4Tv4lN0JHdufuiy4m/TnjIowDR4Eja
         z4ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@posteo.de header.s=2017 header.b=Ar5pik9+;
       spf=pass (google.com: domain of paulwuertz@posteo.de designates 185.67.36.66 as permitted sender) smtp.mailfrom=paulwuertz@posteo.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=posteo.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:to:from:subject:message-id:date:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sS9kFYpZV1Vj5nPi4kGF4rrtBPfoPN2ZrTL0fwaQzN4=;
        b=opBnM9NNMN/beUbHGdg/pFQKNhDD6nfbIt7GuplHd8z3l48NnYt13oMYMvoLvolzEc
         yKvNzif+qAPTqH2Ee/A0cvjGyA5Oi2dJiQfeCOhiVNidA4Dd8cvigv1D/7lTnIBI+Sqa
         epNnNmSz7+QaCI4bsjsIBmStCUhMQX9GGXaj4MGlSEq23MPQuWyhCkFSh2zMJE8B8Sg8
         e8ZD4TKnYsIhF6D5HXmgg0UbtbSVmMR87Qcq1MisdEX6hHIM/DCmksrB/BMNmTSvqlkS
         NNnBA9rge8GaM5Fkac5YVG5qr3bp5t+DuJFHrDNpybezXR0gmOXBVZDONYO36vEEP909
         JriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sS9kFYpZV1Vj5nPi4kGF4rrtBPfoPN2ZrTL0fwaQzN4=;
        b=elbFp45ijQ167D+Df25EQuzM2uw0LZNF0iZn8JxsnIHMnJWZBFoFJ4WajF5fljnBa1
         j31FXP0EPW3QSJDE0tmwlQSEAe3Zsf6yL+/yMJZWbA5szT0OpVkiN8+zUCTuLuyHtTZM
         z0MzIob7p6TArhe++puSYZyB/OJr8NAdettebMahlNfjxVCBKYMBKp2SqPeqgxUlwx/t
         MNLe6/gx5O0YLlv2prt1t1f0eBlo72xt/KvogDTM4XX3CqZAVEK9Ix8a201StHwVyKe/
         hP/wZ7nA6QQPn5Bvj2hYPkjGu3UzbUlrfGnYS34Z86js85Th+P7YeZU2DXwu9ZvvBqNc
         o2Ug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530QOXPPRHSgTUTIsfi88zZzSyn400rHWVgYEGYp8AJuPiw7Q5yV
	tLiCMLCTuKooc6+pmzKJT70=
X-Google-Smtp-Source: ABdhPJxgUQm5jujDbweVNqJOFimRK/fczH8rU57d+a+KaWzN3nA4JfEquQkJSSmmLP4KQaNJ3VN42Q==
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr3291273wro.101.1634778544180;
        Wed, 20 Oct 2021 18:09:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b92:: with SMTP id o18ls2431640wra.0.gmail; Wed, 20 Oct
 2021 18:09:02 -0700 (PDT)
X-Received: by 2002:a05:6000:1567:: with SMTP id 7mr3363860wrz.408.1634778542901;
        Wed, 20 Oct 2021 18:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634778542; cv=none;
        d=google.com; s=arc-20160816;
        b=hVfqSoi6B6aaeCN0GqLw/IYXXp5ghRuYnYeVgQlXntn9lITWOa4i1bBX9UteywkBTX
         IaB6hef+77wWBT7mzQPJBtEtRH1WfVNNNNI4pKgs5k913udmnEdNG8fqCW2//utA9C0O
         7m8PRFI5qxDBBrQT+/R8ZeNxYKL1ZesR79R0SVoz0vDrS2U3DYh+6vJ08sQl3TrBBkLQ
         XEce0E2T2IR6yvsSskxHRhMxsqaXe+yZJyXaKcbNblK4ZxrtKcjhAfvMnQZ4eQMw5jBo
         6+ktzexxbU1dy8jziwnAdUnFff9HvLFwxXVDHE66O3Sn31zdrkGwBR5K/hDjND/FsfFP
         bCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:mime-version:date:message-id:subject:from:to
         :dkim-signature;
        bh=fwDUp7F6eR/KeCFasYJN0h7k7PCXyx25MtZG93U5LHo=;
        b=GlBqABCRRM4xdomdHfNr/XWc2EaW4g8pytYl/mAj9K422rVbr+3DE7tu4Zo2RTwi2B
         XFy8EfJmxREbl+7mxRGaNx9CF/kYgE0WPIUydn9zv33ZJcBZDx8BBk73WFheJkGoidUe
         gLNz+oCU+Z2zPffKNFkRrMJd6BpNMTvqE75ms4mOfkA8Mn7/VyWSlScC4RZ59J6UvjCY
         /nvPXmIaPS3MBo3FaY099HVaJHpBGrEocvlYtjLwqq1V16Yq4AA1cT3CRQe9XT+NfLpA
         pJCoT6G5QvcO2I/WZr/VD2DBs3x14/qCWFSpsSOeFkmufMYU0+o8fjJDD+xqh3ml3zoO
         yFlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@posteo.de header.s=2017 header.b=Ar5pik9+;
       spf=pass (google.com: domain of paulwuertz@posteo.de designates 185.67.36.66 as permitted sender) smtp.mailfrom=paulwuertz@posteo.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Received: from mout02.posteo.de (mout02.posteo.de. [185.67.36.66])
        by gmr-mx.google.com with ESMTPS id g2si507668wmc.4.2021.10.20.18.09.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 18:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of paulwuertz@posteo.de designates 185.67.36.66 as permitted sender) client-ip=185.67.36.66;
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4A97B240101
	for <jailhouse-dev@googlegroups.com>; Thu, 21 Oct 2021 03:09:02 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4HZTrs48fdz6tm9
	for <jailhouse-dev@googlegroups.com>; Thu, 21 Oct 2021 03:09:01 +0200 (CEST)
To: jailhouse-dev@googlegroups.com
From: Paul <paulwuertz@posteo.de>
Subject: Building jailhouse images ultra96v2 issue with crosstool-ng
Message-ID: <fa5430fc-1e41-9e62-1299-107f0a7cdb44@posteo.de>
Date: Thu, 21 Oct 2021 01:09:01 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------220B5068223F869574C10D90"
Content-Language: en-US
X-Original-Sender: paulwuertz@posteo.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@posteo.de header.s=2017 header.b=Ar5pik9+;       spf=pass
 (google.com: domain of paulwuertz@posteo.de designates 185.67.36.66 as
 permitted sender) smtp.mailfrom=paulwuertz@posteo.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=posteo.de
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

This is a multi-part message in MIME format.
--------------220B5068223F869574C10D90
Content-Type: multipart/alternative;
 boundary="------------DB4A0F589093D67D40090A37"


--------------DB4A0F589093D67D40090A37
Content-Type: text/plain; charset="UTF-8"

Hej guys!
I wanted to build the Ultra96v2 ref-image from the jailhouse-images repo
and it failed for some error in crosstool-ng. (see below and the full
build output is attached)
In particular it could not wget the isl-0.20.tar.gz. Wget-ting it from
some package mirror manually into 'build/downloads/crosstool-ng/'
and repeating the build solved the issue.

I found a similar issue on the crosstool-ng github issues[1], but
I dont know how to fix this in the jailhouse-images repo, and did not
see an issueing possibility on the github repo, so I write to you here ^^

I am currently writting my diploma thesis on offloading critical
real-time task comparing co-processors, jailhouse and FPGAs, so thanks
for the work on jailhouse, seems like an interesting concept and I am
looking forward to learn about it ^^.

Greetings!
Paul

[1] https://github.com/crosstool-ng/crosstool-ng/issues/1609

[ERROR] isl: download failed
[ERROR]
[ERROR] >>
[ERROR] >> Build failed in step 'Retrieving needed toolchain components'
tarballs'
[ERROR] >> called in step '(top-level)'
[ERROR] >>
[ERROR] >> Error happened in: CT_Abort[scripts/functions@487]
[ERROR] >> called from: CT_DoFetch[scripts/functions@2103]
[ERROR] >> called from: CT_PackageRun[scripts/functions@2063]
[ERROR] >> called from: CT_Fetch[scripts/functions@2174]
[ERROR] >> called from:
do_isl_get[scripts/build/companion_libs/121-isl.sh@16]
[ERROR] >> called from:
do_companion_libs_get[scripts/build/companion_libs.sh@15]
[ERROR] >> called from: main[scripts/crosstool-NG.sh@648]
[ERROR] >>
[ERROR] >> There is a list of known issues, some with workarounds, in:
[ERROR] >> https://crosstool-ng.github.io/docs/known-issues/
[ERROR] >>
[ERROR] >> NOTE: Your configuration includes features marked EXPERIMENTAL.
[ERROR] >> Before submitting a bug report, try to reproduce it without
enabling
[ERROR] >> any experimental features. Otherwise, you'll need to debug it
[ERROR] >> and present an explanation why it is a bug in crosstool-NG - or
[ERROR] >> preferably, a fix.
[ERROR] >>
[ERROR] >> If you feel this is a bug in crosstool-NG, report it at:
[ERROR] >> https://github.com/crosstool-ng/crosstool-ng/issues/
[ERROR] >>
[ERROR] >> Make sure your report includes all the information pertinent
to this issue.
[ERROR] >> Read the bug reporting guidelines here:
[ERROR] >> http://crosstool-ng.github.io/support/
[ERROR]
[ERROR] (elapsed: 1:52.98)

'

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fa5430fc-1e41-9e62-1299-107f0a7cdb44%40posteo.de.

--------------DB4A0F589093D67D40090A37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hej guys!<br>
      I wanted to build the Ultra96v2 ref-image from the
      jailhouse-images repo and it failed for some error in
      crosstool-ng. (see below and the full build output is attached)<br>
      In particular it could not wget the isl-0.20.tar.gz. Wget-ting it
      from some package mirror manually into
      'build/downloads/crosstool-ng/' <br>
      and repeating the build solved the issue. <br>
      <br>
      I found a similar issue on the crosstool-ng github issues[1], but
      <br>
      I dont know how to fix this in the jailhouse-images repo, and did
      not see an issueing possibility on the github repo, so I write to
      you here ^^<br>
      <br>
      I am currently writting my diploma thesis on offloading critical
      real-time task comparing co-processors, jailhouse and FPGAs, so
      thanks for the work on jailhouse, seems like an interesting
      concept and I am looking forward to learn about it ^^.<br>
      <br>
      Greetings!<br>
      Paul<br>
      <br>
      [1] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/cro=
sstool-ng/crosstool-ng/issues/1609">https://github.com/crosstool-ng/crossto=
ol-ng/issues/1609</a><br>
    </p>
    <div style=3D"color: #d4d4d4;background-color: #1e1e1e;font-family: 'Dr=
oid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: =
normal;font-size: 14px;line-height: 19px;white-space: pre;"><div><span styl=
e=3D"color: #d4d4d4;">[ERROR]    isl: download failed</span></div><div><spa=
n style=3D"color: #d4d4d4;">[ERROR]</span></div><div><span style=3D"color: =
#d4d4d4;">[ERROR]  &gt;&gt;</span></div><div><span style=3D"color: #d4d4d4;=
">[ERROR]  &gt;&gt;  Build failed in step 'Retrieving needed toolchain comp=
onents' tarballs'</span></div><div><span style=3D"color: #d4d4d4;">[ERROR] =
 &gt;&gt;        called in step '(top-level)'</span></div><div><span style=
=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;</span></div><div><span style=3D"colo=
r: #d4d4d4;">[ERROR]  &gt;&gt;  Error happened in: CT_Abort[scripts/functio=
ns@487]</span></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt; =
       called from: CT_DoFetch[scripts/functions@2103]</span></div><div><sp=
an style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;        called from: CT_Packa=
geRun[scripts/functions@2063]</span></div><div><span style=3D"color: #d4d4d=
4;">[ERROR]  &gt;&gt;        called from: CT_Fetch[scripts/functions@2174]<=
/span></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;        c=
alled from: do_isl_get[scripts/build/companion_libs/121-isl.sh@16]</span></=
div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;        called fr=
om: do_companion_libs_get[scripts/build/companion_libs.sh@15]</span></div><=
div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;        called from: m=
ain[scripts/crosstool-NG.sh@648]</span></div><div><span style=3D"color: #d4=
d4d4;">[ERROR]  &gt;&gt;</span></div><div><span style=3D"color: #d4d4d4;">[=
ERROR]  &gt;&gt;  There is a list of known issues, some with workarounds, i=
n:</span></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;      =
<a class=3D"moz-txt-link-freetext" href=3D"https://crosstool-ng.github.io/d=
ocs/known-issues/">https://crosstool-ng.github.io/docs/known-issues/</a></s=
pan></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;</span></di=
v><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt; NOTE: Your configu=
ration includes features marked EXPERIMENTAL.</span></div><div><span style=
=3D"color: #d4d4d4;">[ERROR]  &gt;&gt; Before submitting a bug report, try =
to reproduce it without enabling</span></div><div><span style=3D"color: #d4=
d4d4;">[ERROR]  &gt;&gt; any experimental features. Otherwise, you'll need =
to debug it</span></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&=
gt; and present an explanation why it is a bug in crosstool-NG - or</span><=
/div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt; preferably, a f=
ix.</span></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;</spa=
n></div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;  If you feel=
 this is a bug in crosstool-NG, report it at:</span></div><div><span style=
=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;      <a class=3D"moz-txt-link-freete=
xt" href=3D"https://github.com/crosstool-ng/crosstool-ng/issues/">https://g=
ithub.com/crosstool-ng/crosstool-ng/issues/</a></span></div><div><span styl=
e=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;</span></div><div><span style=3D"col=
or: #d4d4d4;">[ERROR]  &gt;&gt;  Make sure your report includes all the inf=
ormation pertinent to this issue.</span></div><div><span style=3D"color: #d=
4d4d4;">[ERROR]  &gt;&gt;  Read the bug reporting guidelines here:</span></=
div><div><span style=3D"color: #d4d4d4;">[ERROR]  &gt;&gt;      <a class=3D=
"moz-txt-link-freetext" href=3D"http://crosstool-ng.github.io/support/">htt=
p://crosstool-ng.github.io/support/</a></span></div><div><span style=3D"col=
or: #d4d4d4;">[ERROR]</span></div><div><span style=3D"color: #d4d4d4;">[ERR=
OR]  (elapsed: 1:52.98)</span></div></div>
    <p>'<br>
    </p>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fa5430fc-1e41-9e62-1299-107f0a7cdb44%40posteo.de?u=
tm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/ja=
ilhouse-dev/fa5430fc-1e41-9e62-1299-107f0a7cdb44%40posteo.de</a>.<br />

--------------DB4A0F589093D67D40090A37--

--------------220B5068223F869574C10D90
Content-Type: text/plain; charset=UTF-8;
 name="jailhouse_images_error_log.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="jailhouse_images_error_log.txt"

W3A0dzVAcDR3NSBqaW1dJCAuL2J1aWxkLWltYWdlcy5zaApBdmFpbGFibGUgaW1hZ2VzIGRl
bW8gaW1hZ2VzOgogMTogUUVNVS9LVk0gSW50ZWwteDg2IHZpcnR1YWwgdGFyZ2V0CiAyOiBR
RU1VIEFSTSB2aXJ0dWFsIHRhcmdldAogMzogUUVNVSBBUk02NCB2aXJ0dWFsIHRhcmdldAog
NDogT3JhbmdlIFBpIFplcm8gKDI1NiBNQiBlZGl0aW9uKQogNTogSW50ZWwgTlVDIChOVUM2
Q0FZLCA4IEdCIFJBTSkKIDY6IFNJTUFUSUMgSVBDMTI3RSAoMiBjb3JlcyAvIDIgR0IgZWRp
dGlvbikKIDc6IE1hcnZlbGwgRVNQUkVTU09iaW4gKDEgR0IgZWRpdGlvbikKIDg6IE1hcnZl
bGwgTUFDQ0hJQVRPYmluCiA5OiBMZU1ha2VyIEhpS2V5IChLaXJpbiA2MjAgU29DLCAyIEdC
IGVkaXRpb24pCiAxMDogQXZuZXQgVWx0cmE5NiB2MQogMTE6IEF2bmV0IFVsdHJhOTYgdjIK
IDEyOiBSYXNwYmVycnkgUGkgNCAoMS04IEdCIGVkaXRpb25zKQogMTM6IFBpbmU2NCsgKEFs
bHdpbm5lciBBNjQsIDIgR0IgZWRpdGlvbikKIDA6IGFsbCAobWF5IHRha2UgaG91cnMuLi4p
CgpTZWxlY3QgaW1hZ2VzIHRvIGJ1aWxkIChzcGFjZS1zZXBhcmF0ZWQgaW5kZXggbGlzdCk6
IDExCjIwMjEtMTAtMjAgMDE6NDg6MTggLSBJTkZPICAgICAtIGthcyAyLjQgc3RhcnRlZAoy
MDIxLTEwLTIwIDAxOjQ4OjE4IC0gSU5GTyAgICAgLSAvcmVwbyQgZ2l0IHJldi1wYXJzZSAt
LXNob3ctdG9wbGV2ZWwKMjAyMS0xMC0yMCAwMTo0ODoxOCAtIElORk8gICAgIC0gL3JlcG8k
IGdpdCByZXYtcGFyc2UgLS1zaG93LXRvcGxldmVsCjIwMjEtMTAtMjAgMDE6NDg6MTggLSBJ
TkZPICAgICAtIFVzaW5nIC9yZXBvIGFzIHJvb3QgZm9yIHJlcG9zaXRvcnkgamFpbGhvdXNl
CjIwMjEtMTAtMjAgMDE6NDg6MTggLSBJTkZPICAgICAtIC93b3JrJCBnaXQgY2xvbmUgLXEg
aHR0cHM6Ly9naXRodWIuY29tL2lsYmVycy9pc2FyIC93b3JrL2lzYXIKMjAyMS0xMC0yMCAw
MTo0ODoxOSAtIElORk8gICAgIC0gUmVwb3NpdG9yeSBpc2FyIGNsb25lZAoyMDIxLTEwLTIw
IDAxOjQ4OjE5IC0gSU5GTyAgICAgLSAvcmVwbyQgZ2l0IHJldi1wYXJzZSAtLXNob3ctdG9w
bGV2ZWwKMjAyMS0xMC0yMCAwMTo0ODoxOSAtIElORk8gICAgIC0gVXNpbmcgL3JlcG8gYXMg
cm9vdCBmb3IgcmVwb3NpdG9yeSBqYWlsaG91c2UKMjAyMS0xMC0yMCAwMTo0ODoxOSAtIElO
Rk8gICAgIC0gL3dvcmsvaXNhciQgZ2l0IHN0YXR1cyAtcwoyMDIxLTEwLTIwIDAxOjQ4OjIw
IC0gSU5GTyAgICAgLSAvd29yay9pc2FyJCBnaXQgcmV2LXBhcnNlIC0tdmVyaWZ5IC1xIG9y
aWdpbi9kYmI5ZGY2N2MxMzIxYWE3ZjYwMjA5NDhhOTY0YTJiY2Y2MzY2ODRhCjIwMjEtMTAt
MjAgMDE6NDg6MjAgLSBJTkZPICAgICAtIC93b3JrL2lzYXIkIGdpdCBjaGVja291dCAtcSBk
YmI5ZGY2N2MxMzIxYWE3ZjYwMjA5NDhhOTY0YTJiY2Y2MzY2ODRhCjIwMjEtMTAtMjAgMDE6
NDg6MjAgLSBJTkZPICAgICAtIC9yZXBvJCBnaXQgcmV2LXBhcnNlIC0tc2hvdy10b3BsZXZl
bAoyMDIxLTEwLTIwIDAxOjQ4OjIwIC0gSU5GTyAgICAgLSBVc2luZyAvcmVwbyBhcyByb290
IGZvciByZXBvc2l0b3J5IGphaWxob3VzZQoyMDIxLTEwLTIwIDAxOjQ4OjIwIC0gSU5GTyAg
ICAgLSAvd29yay9pc2FyJCAvdG1wL3RtcF9hNGJleXpuL2dldF9iYl9lbnYgL3dvcmsvYnVp
bGQKMjAyMS0xMC0yMCAwMTo0ODoyMCAtIElORk8gICAgIC0gL3JlcG8kIGdpdCByZXYtcGFy
c2UgLS1zaG93LXRvcGxldmVsCjIwMjEtMTAtMjAgMDE6NDg6MjAgLSBJTkZPICAgICAtIFVz
aW5nIC9yZXBvIGFzIHJvb3QgZm9yIHJlcG9zaXRvcnkgamFpbGhvdXNlCjIwMjEtMTAtMjAg
MDE6NDg6MjAgLSBJTkZPICAgICAtIC9yZXBvJCBnaXQgcmV2LXBhcnNlIC0tc2hvdy10b3Bs
ZXZlbAoyMDIxLTEwLTIwIDAxOjQ4OjIwIC0gSU5GTyAgICAgLSBVc2luZyAvcmVwbyBhcyBy
b290IGZvciByZXBvc2l0b3J5IGphaWxob3VzZQoyMDIxLTEwLTIwIDAxOjQ4OjIwIC0gSU5G
TyAgICAgLSAvd29yay9idWlsZCQgL3dvcmsvaXNhci9iaXRiYWtlL2Jpbi9iaXRiYWtlIC1j
IGJ1aWxkIG1jOnVsdHJhOTYtdjItamFpbGhvdXNlLWRlbW86ZGVtby1pbWFnZQpQYXJzaW5n
IHJlY2lwZXM6IDEwMCUgfCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyN8IFRpbWU6IDA6MDA6
MDAKUGFyc2luZyBvZiAzOCAuYmIgZmlsZXMgY29tcGxldGUgKDAgY2FjaGVkLCAzOCBwYXJz
ZWQpLiA3NiB0YXJnZXRzLCAwIHNraXBwZWQsIDAgbWFza2VkLCAwIGVycm9ycy4KTk9URTog
UmVzb2x2aW5nIGFueSBtaXNzaW5nIHRhc2sgcXVldWUgZGVwZW5kZW5jaWVzCk5PVEU6IFJl
c29sdmluZyBhbnkgbWlzc2luZyB0YXNrIHF1ZXVlIGRlcGVuZGVuY2llcwpOT1RFOiBSZXNv
bHZpbmcgYW55IG1pc3NpbmcgdGFzayBxdWV1ZSBkZXBlbmRlbmNpZXMKTk9URTogUmVzb2x2
aW5nIGFueSBtaXNzaW5nIHRhc2sgcXVldWUgZGVwZW5kZW5jaWVzCkluaXRpYWxpc2luZyB0
YXNrczogMTAwJSB8IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wgVGltZTogMDowMDowMApOT1RF
OiBObyBzZXRzY2VuZSB0YXNrcwpOT1RFOiBFeGVjdXRpbmcgVGFza3MKRVJST1I6IG1jOnVs
dHJhOTYtdjItamFpbGhvdXNlLWRlbW86Y3Jvc3N0b29sLW5nLW1pY3JvYmxhemUtMS4yNC4w
LXIwIGRvX2Rwa2dfYnVpbGQ6IEVycm9yIGV4ZWN1dGluZyBhIHB5dGhvbiBmdW5jdGlvbiBp
biBleGVjX3B5dGhvbl9mdW5jKCkgYXV0b2dlbmVyYXRlZDoKClRoZSBzdGFjayB0cmFjZSBv
ZiBweXRob24gY2FsbHMgdGhhdCByZXN1bHRlZCBpbiB0aGlzIGV4Y2VwdGlvbi9mYWlsdXJl
IHdhczoKRmlsZTogJ2V4ZWNfcHl0aG9uX2Z1bmMoKSBhdXRvZ2VuZXJhdGVkJywgbGluZW5v
OiAyLCBmdW5jdGlvbjogPG1vZHVsZT4KICAgICAwMDAxOgogKioqIDAwMDI6ZG9fZHBrZ19i
dWlsZChkKQogICAgIDAwMDM6CkZpbGU6ICcvd29yay9pc2FyL21ldGEvY2xhc3Nlcy9kcGtn
LWJhc2UuYmJjbGFzcycsIGxpbmVubzogMTc4LCBmdW5jdGlvbjogZG9fZHBrZ19idWlsZAog
ICAgIDAxNzQ6cHl0aG9uIGRvX2Rwa2dfYnVpbGQoKSB7CiAgICAgMDE3NTogICAgbG9jayA9
IGJiLnV0aWxzLmxvY2tmaWxlKGQuZ2V0VmFyKCJSRVBPX0lTQVJfRElSIikgKyAiL2lzYXIu
bG9jayIsCiAgICAgMDE3NjogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNoYXJlZD1U
cnVlKQogICAgIDAxNzc6ICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygiZHBrZ19kb19tb3VudHMi
LCBkKQogKioqIDAxNzg6ICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygiZHBrZ19ydW5idWlsZCIs
IGQpCiAgICAgMDE3OTogICAgYmIuYnVpbGQuZXhlY19mdW5jKCJkcGtnX3VuZG9fbW91bnRz
IiwgZCkKICAgICAwMTgwOiAgICBiYi51dGlscy51bmxvY2tmaWxlKGxvY2spCiAgICAgMDE4
MTp9CiAgICAgMDE4MjoKRmlsZTogJy93b3JrL2lzYXIvYml0YmFrZS9saWIvYmIvYnVpbGQu
cHknLCBsaW5lbm86IDI1MSwgZnVuY3Rpb246IGV4ZWNfZnVuYwogICAgIDAyNDc6ICAgIHdp
dGggYmIudXRpbHMuZmlsZXNsb2NrZWQobG9ja2ZpbGVzKToKICAgICAwMjQ4OiAgICAgICAg
aWYgaXNweXRob246CiAgICAgMDI0OTogICAgICAgICAgICBleGVjX2Z1bmNfcHl0aG9uKGZ1
bmMsIGQsIHJ1bmZpbGUsIGN3ZD1hZGlyKQogICAgIDAyNTA6ICAgICAgICBlbHNlOgogKioq
IDAyNTE6ICAgICAgICAgICAgZXhlY19mdW5jX3NoZWxsKGZ1bmMsIGQsIHJ1bmZpbGUsIGN3
ZD1hZGlyKQogICAgIDAyNTI6CiAgICAgMDI1MzogICAgdHJ5OgogICAgIDAyNTQ6ICAgICAg
ICBjdXJjd2QgPSBvcy5nZXRjd2QoKQogICAgIDAyNTU6ICAgIGV4Y2VwdDoKRmlsZTogJy93
b3JrL2lzYXIvYml0YmFrZS9saWIvYmIvYnVpbGQucHknLCBsaW5lbm86IDQ1MiwgZnVuY3Rp
b246IGV4ZWNfZnVuY19zaGVsbAogICAgIDA0NDg6ICAgIHdpdGggb3BlbihmaWZvcGF0aCwg
J3IrYicsIGJ1ZmZlcmluZz0wKSBhcyBmaWZvOgogICAgIDA0NDk6ICAgICAgICB0cnk6CiAg
ICAgMDQ1MDogICAgICAgICAgICBiYi5kZWJ1ZygyLCAiRXhlY3V0aW5nIHNoZWxsIGZ1bmN0
aW9uICVzIiAlIGZ1bmMpCiAgICAgMDQ1MTogICAgICAgICAgICB3aXRoIG9wZW4ob3MuZGV2
bnVsbCwgJ3IrJykgYXMgc3RkaW4sIGxvZ2ZpbGU6CiAqKiogMDQ1MjogICAgICAgICAgICAg
ICAgYmIucHJvY2Vzcy5ydW4oY21kLCBzaGVsbD1GYWxzZSwgc3RkaW49c3RkaW4sIGxvZz1s
b2dmaWxlLCBleHRyYWZpbGVzPVsoZmlmbyxyZWFkZmlmbyldKQogICAgIDA0NTM6ICAgICAg
ICBmaW5hbGx5OgogICAgIDA0NTQ6ICAgICAgICAgICAgb3MudW5saW5rKGZpZm9wYXRoKQog
ICAgIDA0NTU6CiAgICAgMDQ1NjogICAgYmIuZGVidWcoMiwgIlNoZWxsIGZ1bmN0aW9uICVz
IGZpbmlzaGVkIiAlIGZ1bmMpCkZpbGU6ICcvd29yay9pc2FyL2JpdGJha2UvbGliL2JiL3By
b2Nlc3MucHknLCBsaW5lbm86IDE4MiwgZnVuY3Rpb246IHJ1bgogICAgIDAxNzg6ICAgICAg
ICBpZiBub3Qgc3RkZXJyIGlzIE5vbmU6CiAgICAgMDE3OTogICAgICAgICAgICBzdGRlcnIg
PSBzdGRlcnIuZGVjb2RlKCJ1dGYtOCIpCiAgICAgMDE4MDoKICAgICAwMTgxOiAgICBpZiBw
aXBlLnJldHVybmNvZGUgIT0gMDoKICoqKiAwMTgyOiAgICAgICAgcmFpc2UgRXhlY3V0aW9u
RXJyb3IoY21kLCBwaXBlLnJldHVybmNvZGUsIHN0ZG91dCwgc3RkZXJyKQogICAgIDAxODM6
ICAgIHJldHVybiBzdGRvdXQsIHN0ZGVycgpFeGNlcHRpb246IGJiLnByb2Nlc3MuRXhlY3V0
aW9uRXJyb3I6IEV4ZWN1dGlvbiBvZiAnL3dvcmsvYnVpbGQvdG1wL3dvcmsvamFpbGhvdXNl
LWRlbW8tYXJtNjQvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUvMS4yNC4wLXIwL3RlbXAvcnVu
LmRwa2dfcnVuYnVpbGQuMzYwNTUnIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAyOgpkcGtnLWJ1
aWxkcGFja2FnZTogaW5mbzogc291cmNlIHBhY2thZ2UgY3Jvc3N0b29sLW5nLW1pY3JvYmxh
emUKZHBrZy1idWlsZHBhY2thZ2U6IGluZm86IHNvdXJjZSB2ZXJzaW9uIDEuMjQuMApkcGtn
LWJ1aWxkcGFja2FnZTogaW5mbzogc291cmNlIGRpc3RyaWJ1dGlvbiBVTlJFTEVBU0VECmRw
a2ctYnVpbGRwYWNrYWdlOiBpbmZvOiBzb3VyY2UgY2hhbmdlZCBieSBVbmtub3duIG1haW50
YWluZXIgPHVua25vd25AZXhhbXBsZS5jb20+CmRwa2ctYXJjaGl0ZWN0dXJlOiB3YXJuaW5n
OiBzcGVjaWZpZWQgR05VIHN5c3RlbSB0eXBlIGFhcmNoNjQtbGludXgtZ251IGRvZXMgbm90
IG1hdGNoIENDIHN5c3RlbSB0eXBlIHg4Nl82NC1saW51eC1nbnUsIHRyeSBzZXR0aW5nIGEg
Y29ycmVjdCBDQyBlbnZpcm9ubWVudCB2YXJpYWJsZQogZHBrZy1zb3VyY2UgLUkgLS1iZWZv
cmUtYnVpbGQgLgpkcGtnLWJ1aWxkcGFja2FnZTogaW5mbzogaG9zdCBhcmNoaXRlY3R1cmUg
YXJtNjQKIGZha2Vyb290IGRlYmlhbi9ydWxlcyBjbGVhbgpkaCBjbGVhbiAtLXBhcmFsbGVs
CiAgIGRlYmlhbi9ydWxlcyBvdmVycmlkZV9kaF9hdXRvX2NsZWFuCm1ha2VbMV06IEVudGVy
aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9j
cm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcKZGhfYXV0b19jbGVhbgpbICEgLWQg
Lmluc3RhbGwgXSB8fCBjaG1vZCB1K3cgLVIgLmluc3RhbGwKcm0gLXJmIC5idWlsZCAuaW5z
dGFsbAptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9jcm9zc3Rv
b2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcKICAg
ZGhfY2xlYW4gLU8tLXBhcmFsbGVsCiBkcGtnLXNvdXJjZSAtSSAtYiAuCmRwa2ctc291cmNl
OiB3YXJuaW5nOiBubyBzb3VyY2UgZm9ybWF0IHNwZWNpZmllZCBpbiBkZWJpYW4vc291cmNl
L2Zvcm1hdCwgc2VlIGRwa2ctc291cmNlKDEpCmRwa2ctc291cmNlOiB3YXJuaW5nOiBzb3Vy
Y2UgZGlyZWN0b3J5ICdjcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcgaXMgbm90
IDxzb3VyY2VwYWNrYWdlPi08dXBzdHJlYW12ZXJzaW9uPiAnY3Jvc3N0b29sLW5nLW1pY3Jv
YmxhemUtMS4yNC4wJwpkcGtnLXNvdXJjZTogaW5mbzogdXNpbmcgc291cmNlIGZvcm1hdCAn
MS4wJwpkcGtnLXNvdXJjZTogaW5mbzogYnVpbGRpbmcgY3Jvc3N0b29sLW5nLW1pY3JvYmxh
emUgaW4gY3Jvc3N0b29sLW5nLW1pY3JvYmxhemVfMS4yNC4wLnRhci5negpkcGtnLXNvdXJj
ZTogaW5mbzogYnVpbGRpbmcgY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUgaW4gY3Jvc3N0b29s
LW5nLW1pY3JvYmxhemVfMS4yNC4wLmRzYwogZGViaWFuL3J1bGVzIGJ1aWxkCmRoIGJ1aWxk
IC0tcGFyYWxsZWwKICAgZGhfdXBkYXRlX2F1dG90b29sc19jb25maWcgLU8tLXBhcmFsbGVs
CiAgIGRlYmlhbi9ydWxlcyBvdmVycmlkZV9kaF9hdXRvX2NvbmZpZ3VyZQptYWtlWzFdOiBF
bnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2J1aWxkZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxh
emUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0LjAnCnRlc3QgLWUgY29uZmlndXJl
IHx8IC4vYm9vdHN0cmFwCklORk8gIDo6ICoqKiBHZW5lcmF0aW5nIHBhY2thZ2UgdmVyc2lv
biBkZXNjcmlwdGlvbnMKSU5GTyAgOjogTWFzdGVyIHBhY2thZ2VzOiBhbmRyb2lkLW5kayBh
dXRvY29uZiBhdXRvbWFrZSBhdnItbGliYyBiaW51dGlscyBiaXNvbiBjbG9vZyBkdGMgZHVt
YSBlbGYyZmx0IGV4cGF0IGdjYyBnZGIgZ2V0dGV4dCBnbGliYy1wb3J0cyBnbGliYyBnbXAg
aXNsIGxpYmVsZiBsaWJpY29udiBsaWJ0b29sIGxpbnV4IGx0cmFjZSBtNCBtYWtlIG1pbmd3
LXc2NCBtb3hpZWJveCBtcGMgbXBmciBtdXNsIG5jdXJzZXMgbmV3bGliIHN0cmFjZSB1Q2xp
YmMgemxpYgpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvYW5kcm9pZC1u
ZGsuaW4nCklORk8gIDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJzaW9ucy9hdXRvY29uZi5p
bicKSU5GTyAgOjogR2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL2F1dG9tYWtlLmluJwpJ
TkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvYXZyLWxpYmMuaW4nCklORk8g
IDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJzaW9ucy9iaW51dGlscy5pbicKSU5GTyAgOjog
R2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL2Jpc29uLmluJwpJTkZPICA6OiBHZW5lcmF0
aW5nICdjb25maWcvdmVyc2lvbnMvY2xvb2cuaW4nCklORk8gIDo6IEdlbmVyYXRpbmcgJ2Nv
bmZpZy92ZXJzaW9ucy9kdGMuaW4nCklORk8gIDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJz
aW9ucy9kdW1hLmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvZWxm
MmZsdC5pbicKSU5GTyAgOjogR2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL2V4cGF0Lmlu
JwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvZ2NjLmluJwpJTkZPICA6
OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvZ2RiLmluJwpJTkZPICA6OiBHZW5lcmF0
aW5nICdjb25maWcvdmVyc2lvbnMvZ2V0dGV4dC5pbicKSU5GTyAgOjogR2VuZXJhdGluZyAn
Y29uZmlnL3ZlcnNpb25zL2dsaWJjLXBvcnRzLmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdj
b25maWcvdmVyc2lvbnMvZ2xpYmMuaW4nCklORk8gIDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92
ZXJzaW9ucy9nbXAuaW4nCklORk8gIDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJzaW9ucy9p
c2wuaW4nCklORk8gIDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJzaW9ucy9saWJlbGYuaW4n
CklORk8gIDo6IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJzaW9ucy9saWJpY29udi5pbicKSU5G
TyAgOjogR2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL2xpYnRvb2wuaW4nCklORk8gIDo6
IEdlbmVyYXRpbmcgJ2NvbmZpZy92ZXJzaW9ucy9saW51eC5pbicKSU5GTyAgOjogR2VuZXJh
dGluZyAnY29uZmlnL3ZlcnNpb25zL2x0cmFjZS5pbicKSU5GTyAgOjogR2VuZXJhdGluZyAn
Y29uZmlnL3ZlcnNpb25zL200LmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVy
c2lvbnMvbWFrZS5pbicKSU5GTyAgOjogR2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL21p
bmd3LXc2NC5pbicKSU5GTyAgOjogR2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL21veGll
Ym94LmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvbXBjLmluJwpJ
TkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvbXBmci5pbicKSU5GTyAgOjog
R2VuZXJhdGluZyAnY29uZmlnL3ZlcnNpb25zL211c2wuaW4nCklORk8gIDo6IEdlbmVyYXRp
bmcgJ2NvbmZpZy92ZXJzaW9ucy9uY3Vyc2VzLmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdj
b25maWcvdmVyc2lvbnMvbmV3bGliLmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcv
dmVyc2lvbnMvc3RyYWNlLmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lv
bnMvdUNsaWJjLmluJwpJTkZPICA6OiBHZW5lcmF0aW5nICdjb25maWcvdmVyc2lvbnMvemxp
Yi5pbicKSU5GTyAgOjogKioqIEdlbmVyYXRpbmcgbWVudS9jaG9pY2Ugc2VsZWN0aW9ucwpJ
TkZPICA6OiBHZW5lcmF0aW5nIGFyY2guaW4gKGNob2ljZSkKSU5GTyAgOjogR2VuZXJhdGlu
ZyBrZXJuZWwuaW4gKGNob2ljZSkKSU5GTyAgOjogR2VuZXJhdGluZyBjYy5pbiAoY2hvaWNl
KQpJTkZPICA6OiBHZW5lcmF0aW5nIGJpbnV0aWxzLmluIChjaG9pY2UpCklORk8gIDo6IEdl
bmVyYXRpbmcgbGliYy5pbiAoY2hvaWNlKQpJTkZPICA6OiBHZW5lcmF0aW5nIGRlYnVnLmlu
IChtZW51KQpJTkZPICA6OiBHZW5lcmF0aW5nIGNvbXBfdG9vbHMuaW4gKG1lbnUpCklORk8g
IDo6IEdlbmVyYXRpbmcgY29tcF9saWJzLmluIChtZW51KQpJTkZPICA6OiAqKiogR2F0aGVy
aW5nIHRoZSBsaXN0IG9mIGRhdGEgZmlsZXMgdG8gaW5zdGFsbApJTkZPICA6OiAqKiogUnVu
bmluZyBhdXRvcmVjb25mCklORk8gIDo6ICoqKiBEb25lIQouL2NvbmZpZ3VyZSAtLWVuYWJs
ZS1sb2NhbApjaGVja2luZyBmb3IgYSBCU0QtY29tcGF0aWJsZSBpbnN0YWxsLi4uIC91c3Iv
YmluL2luc3RhbGwgLWMKY2hlY2tpbmcgd2hldGhlciBidWlsZCBlbnZpcm9ubWVudCBpcyBz
YW5lLi4uIHllcwpjaGVja2luZyBmb3IgYSB0aHJlYWQtc2FmZSBta2RpciAtcC4uLiAvdXNy
L2Jpbi9ta2RpciAtcApjaGVja2luZyBmb3IgZ2F3ay4uLiBnYXdrCmNoZWNraW5nIHdoZXRo
ZXIgbWFrZSBzZXRzICQoTUFLRSkuLi4geWVzCmNoZWNraW5nIHdoZXRoZXIgbWFrZSBzdXBw
b3J0cyBuZXN0ZWQgdmFyaWFibGVzLi4uIHllcwpjaGVja2luZyBob3cgdG8gY3JlYXRlIGEg
cGF4IHRhciBhcmNoaXZlLi4uIGdudXRhcgpjaGVja2luZyB3aGV0aGVyIHRvIGVuYWJsZSBt
YWludGFpbmVyLXNwZWNpZmljIHBvcnRpb25zIG9mIE1ha2VmaWxlcy4uLiB5ZXMKY2hlY2tp
bmcgYnVpbGQgc3lzdGVtIHR5cGUuLi4geDg2XzY0LXBjLWxpbnV4LWdudQpjaGVja2luZyBo
b3N0IHN5c3RlbSB0eXBlLi4uIHg4Nl82NC1wYy1saW51eC1nbnUKY2hlY2tpbmcgd2hldGhl
ciBsbiAtcyB3b3Jrcy4uLiB5ZXMKY2hlY2tpbmcgd2hldGhlciBpbnN0YWxsIHRha2VzIC0t
c3RyaXAtcHJvZ3JhbSBvcHRpb24uLi4geWVzCmNoZWNraW5nIGZvciBnZ3JlcC4uLiBubwpj
aGVja2luZyBmb3IgZ3JlcC4uLiBncmVwCmNoZWNraW5nIGZvciBhYnNvbHV0ZSBwYXRoIHRv
IGdyZXAuLi4gL3Vzci9iaW4vZ3JlcApjaGVja2luZyBmb3IgZ2VncmVwLi4uIG5vCmNoZWNr
aW5nIGZvciBlZ3JlcC4uLiBlZ3JlcApjaGVja2luZyBmb3IgYWJzb2x1dGUgcGF0aCB0byBl
Z3JlcC4uLiAvdXNyL2Jpbi9lZ3JlcApjaGVja2luZyBmb3IgZ3JlcCB0aGF0IGhhbmRsZXMg
bG9uZyBsaW5lcyBhbmQgLWUuLi4gL3Vzci9iaW4vZ3JlcApjaGVja2luZyBmb3IgZWdyZXAu
Li4gL3Vzci9iaW4vZ3JlcCAtRQpjaGVja2luZyBmb3Igc2VkLi4uIC91c3IvYmluL3NlZApj
aGVja2luZyBmb3IgR05VIHNlZCA+PSA0LjAuLi4geWVzCmNoZWNraW5nIGZvciBnY2MuLi4g
Z2NjCmNoZWNraW5nIHdoZXRoZXIgdGhlIEMgY29tcGlsZXIgd29ya3MuLi4geWVzCmNoZWNr
aW5nIGZvciBDIGNvbXBpbGVyIGRlZmF1bHQgb3V0cHV0IGZpbGUgbmFtZS4uLiBhLm91dApj
aGVja2luZyBmb3Igc3VmZml4IG9mIGV4ZWN1dGFibGVzLi4uCmNoZWNraW5nIHdoZXRoZXIg
d2UgYXJlIGNyb3NzIGNvbXBpbGluZy4uLiBubwpjaGVja2luZyBmb3Igc3VmZml4IG9mIG9i
amVjdCBmaWxlcy4uLiBvCmNoZWNraW5nIHdoZXRoZXIgd2UgYXJlIHVzaW5nIHRoZSBHTlUg
QyBjb21waWxlci4uLiB5ZXMKY2hlY2tpbmcgd2hldGhlciBnY2MgYWNjZXB0cyAtZy4uLiB5
ZXMKY2hlY2tpbmcgZm9yIGdjYyBvcHRpb24gdG8gYWNjZXB0IElTTyBDODkuLi4gbm9uZSBu
ZWVkZWQKY2hlY2tpbmcgd2hldGhlciBnY2MgdW5kZXJzdGFuZHMgLWMgYW5kIC1vIHRvZ2V0
aGVyLi4uIHllcwpjaGVja2luZyB3aGV0aGVyIG1ha2Ugc3VwcG9ydHMgdGhlIGluY2x1ZGUg
ZGlyZWN0aXZlLi4uIHllcyAoR05VIHN0eWxlKQpjaGVja2luZyBkZXBlbmRlbmN5IHN0eWxl
IG9mIGdjYy4uLiBnY2MzCmNoZWNraW5nIGZvciBnKysuLi4gZysrCmNoZWNraW5nIHdoZXRo
ZXIgd2UgYXJlIHVzaW5nIHRoZSBHTlUgQysrIGNvbXBpbGVyLi4uIHllcwpjaGVja2luZyB3
aGV0aGVyIGcrKyBhY2NlcHRzIC1nLi4uIHllcwpjaGVja2luZyBkZXBlbmRlbmN5IHN0eWxl
IG9mIGcrKy4uLiBnY2MzCmNoZWNraW5nIGhvdyB0byBydW4gdGhlIEMgcHJlcHJvY2Vzc29y
Li4uIGdjYyAtRQpjaGVja2luZyBmb3IgZmxleC4uLiBmbGV4CmNoZWNraW5nIGxleCBvdXRw
dXQgZmlsZSByb290Li4uIGxleC55eQpjaGVja2luZyBsZXggbGlicmFyeS4uLiBub25lIG5l
ZWRlZApjaGVja2luZyB3aGV0aGVyIHl5dGV4dCBpcyBhIHBvaW50ZXIuLi4gbm8KY2hlY2tp
bmcgZm9yIGJpc29uLi4uIGJpc29uIC15CmNoZWNraW5nIHdoZXRoZXIgZysrIHN1cHBvcnRz
IEMrKzExIGZlYXR1cmVzIHdpdGggLXN0ZD1nbnUrKzExLi4uIHllcwpjaGVja2luZyBpZiBn
Y2MgY2FuIHN0YXRpYyBsaW5rLi4uIHllcwpjaGVja2luZyBmb3IgcmFubGliLi4uIHJhbmxp
YgpjaGVja2luZyBmb3IgZ29iamNvcHkuLi4gbm8KY2hlY2tpbmcgZm9yIG9iamNvcHkuLi4g
b2JqY29weQpjaGVja2luZyBmb3IgYWJzb2x1dGUgcGF0aCB0byBvYmpjb3B5Li4uIC91c3Iv
YmluL29iamNvcHkKY2hlY2tpbmcgZm9yIGdvYmpkdW1wLi4uIG5vCmNoZWNraW5nIGZvciBv
YmpkdW1wLi4uIG9iamR1bXAKY2hlY2tpbmcgZm9yIGFic29sdXRlIHBhdGggdG8gb2JqZHVt
cC4uLiAvdXNyL2Jpbi9vYmpkdW1wCmNoZWNraW5nIGZvciBncmVhZGVsZi4uLiBubwpjaGVj
a2luZyBmb3IgcmVhZGVsZi4uLiByZWFkZWxmCmNoZWNraW5nIGZvciBhYnNvbHV0ZSBwYXRo
IHRvIHJlYWRlbGYuLi4gL3Vzci9iaW4vcmVhZGVsZgpjaGVja2luZyBmb3IgZmxleC4uLiBm
bGV4CmNoZWNraW5nIGZvciBtYWtlaW5mby4uLiBtYWtlaW5mbwpjaGVja2luZyBmb3IgY3V0
Li4uIGN1dApjaGVja2luZyBmb3IgcmVhZGxpbmsuLi4gcmVhZGxpbmsKY2hlY2tpbmcgZm9y
IHRhci4uLiB0YXIKY2hlY2tpbmcgZm9yIGd6aXAuLi4gZ3ppcApjaGVja2luZyBmb3IgYnpp
cDIuLi4gYnppcDIKY2hlY2tpbmcgZm9yIHh6Li4uIHh6CmNoZWNraW5nIGZvciB1bnppcC4u
LiB1bnppcApjaGVja2luZyBmb3IgaGVscDJtYW4uLi4gaGVscDJtYW4KY2hlY2tpbmcgZm9y
IGZpbGUuLi4gZmlsZQpjaGVja2luZyBmb3Igd2hpY2guLi4gd2hpY2gKY2hlY2tpbmcgZm9y
IGx6aXAuLi4gbm8KY2hlY2tpbmcgZm9yIHdnZXQuLi4gd2dldApjaGVja2luZyBmb3IgY3Vy
bC4uLiBubwpjaGVja2luZyB3aGV0aGVyIHRvIHVzZSBnZXRjb25mIG9yIHN5c2N0bCB0byBj
b3VudCBDUFVzLi4uIGdldGNvbmYgX05QUk9DRVNTT1JTX09OTE4KY2hlY2tpbmcgZm9yIGdw
YXRjaC4uLiBubwpjaGVja2luZyBmb3IgcGF0Y2guLi4gcGF0Y2gKY2hlY2tpbmcgZm9yIGFi
c29sdXRlIHBhdGggdG8gcGF0Y2guLi4gL3Vzci9iaW4vcGF0Y2gKY2hlY2tpbmcgZm9yIGJh
c2guLi4gL3Vzci9iaW4vYmFzaApjaGVja2luZyBmb3IgR05VIGJhc2ggPj0gMy4xLi4uIHll
cwpjaGVja2luZyBmb3IgYWJzb2x1dGUgcGF0aCB0byBnYXdrLi4uIC91c3IvYmluL2dhd2sK
Y2hlY2tpbmcgZm9yIEdOVSBhd2suLi4geWVzCmNoZWNraW5nIGZvciBtYWtlLi4uIC91c3Iv
YmluL21ha2UKY2hlY2tpbmcgZm9yIEdOVSBtYWtlID49IDMuODEuLi4geWVzCmNoZWNraW5n
IGZvciBHTlUgbWFrZSA+PSA0LjAuLi4geWVzCmNoZWNraW5nIGZvciBsaWJ0b29sLi4uIC91
c3IvYmluL2xpYnRvb2wKY2hlY2tpbmcgZm9yIEdOVSBsaWJ0b29sID49IDIuNC4uLiB5ZXMK
Y2hlY2tpbmcgZm9yIGxpYnRvb2xpemUuLi4gL3Vzci9iaW4vbGlidG9vbGl6ZQpjaGVja2lu
ZyBmb3IgR05VIGxpYnRvb2xpemUgPj0gMi40Li4uIHllcwpjaGVja2luZyBmb3IgR05VIGF1
dG9jb25mID49IDIuNjUuLi4geWVzCmNoZWNraW5nIGZvciBhdXRvcmVjb25mLi4uIC91c3Iv
YmluL2F1dG9yZWNvbmYKY2hlY2tpbmcgZm9yIEdOVSBhdXRvcmVjb25mID49IDIuNjMuLi4g
eWVzCmNoZWNraW5nIGZvciBHTlUgYXV0b21ha2UgPj0gMS4xNS4uLiB5ZXMKY2hlY2tpbmcg
Zm9yIG00Li4uIC91c3IvYmluL200CmNoZWNraW5nIGZvciBHTlUgbTQgPj0gMS40LjEyLi4u
IHllcwpjaGVja2luZyBmb3IgcHl0aG9uLi4uIC91c3IvYmluL3B5dGhvbjMuNwpjaGVja2lu
ZyBmb3IgUHl0aG9uLi4uIHllcwpjaGVja2luZyBmb3IgUHl0aG9uID49IDMuNC4uLiB5ZXMK
Y2hlY2tpbmcgZm9yIGJpc29uLi4uIC91c3IvYmluL2Jpc29uCmNoZWNraW5nIGZvciBiaXNv
biA+PSAyLjcuLi4geWVzCmNoZWNraW5nIGZvciBkdGMuLi4gbm8KY2hlY2tpbmcgZm9yIGN2
cy4uLiBubwpjaGVja2luZyBmb3Igc3ZuLi4uIG5vCmNoZWNraW5nIGZvciBnaXQuLi4gZ2l0
CmNoZWNraW5nIGZvciBnbWQ1c3VtLi4uIG5vCmNoZWNraW5nIGZvciBtZDVzdW0uLi4gL3Vz
ci9iaW4vbWQ1c3VtCmNoZWNraW5nIGZvciBnc2hhMXN1bS4uLiBubwpjaGVja2luZyBmb3Ig
c2hhMXN1bS4uLiAvdXNyL2Jpbi9zaGExc3VtCmNoZWNraW5nIGZvciBnc2hhMjU2c3VtLi4u
IG5vCmNoZWNraW5nIGZvciBzaGEyNTZzdW0uLi4gL3Vzci9iaW4vc2hhMjU2c3VtCmNoZWNr
aW5nIGZvciBnc2hhNTEyc3VtLi4uIG5vCmNoZWNraW5nIGZvciBzaGE1MTJzdW0uLi4gL3Vz
ci9iaW4vc2hhNTEyc3VtCmNoZWNraW5nIGZvciBpbmxpbmUuLi4gaW5saW5lCmNoZWNraW5n
IGZvciBBTlNJIEMgaGVhZGVyIGZpbGVzLi4uIHllcwpjaGVja2luZyBmb3Igc3lzL3R5cGVz
LmguLi4geWVzCmNoZWNraW5nIGZvciBzeXMvc3RhdC5oLi4uIHllcwpjaGVja2luZyBmb3Ig
c3RkbGliLmguLi4geWVzCmNoZWNraW5nIGZvciBzdHJpbmcuaC4uLiB5ZXMKY2hlY2tpbmcg
Zm9yIG1lbW9yeS5oLi4uIHllcwpjaGVja2luZyBmb3Igc3RyaW5ncy5oLi4uIHllcwpjaGVj
a2luZyBmb3IgaW50dHlwZXMuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHN0ZGludC5oLi4uIHll
cwpjaGVja2luZyBmb3IgdW5pc3RkLmguLi4geWVzCmNoZWNraW5nIGZvciBzdGRsaWIuaC4u
LiAoY2FjaGVkKSB5ZXMKY2hlY2tpbmcgZm9yIEdOVSBsaWJjIGNvbXBhdGlibGUgbWFsbG9j
Li4uIHllcwpjaGVja2luZyBmb3Igc3RkbGliLmguLi4gKGNhY2hlZCkgeWVzCmNoZWNraW5n
IGZvciBHTlUgbGliYyBjb21wYXRpYmxlIHJlYWxsb2MuLi4geWVzCmNoZWNraW5nIGZvciBz
aXplX3QuLi4geWVzCmNoZWNraW5nIGZvciB3b3JraW5nIGFsbG9jYS5oLi4uIHllcwpjaGVj
a2luZyBmb3IgYWxsb2NhLi4uIHllcwpjaGVja2luZyBmb3IgbGQgdXNlZCBieSBnY2MuLi4g
L3Vzci9iaW4vbGQKY2hlY2tpbmcgaWYgdGhlIGxpbmtlciAoL3Vzci9iaW4vbGQpIGlzIEdO
VSBsZC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHNoYXJlZCBsaWJyYXJ5IHJ1biBwYXRoIG9yaWdp
bi4uLiBkb25lCmNoZWNraW5nIHdoZXRoZXIgTkxTIGlzIHJlcXVlc3RlZC4uLiB5ZXMKY2hl
Y2tpbmcgZm9yIENGUHJlZmVyZW5jZXNDb3B5QXBwVmFsdWUuLi4gbm8KY2hlY2tpbmcgZm9y
IENGTG9jYWxlQ29weUN1cnJlbnQuLi4gbm8KY2hlY2tpbmcgZm9yIEdOVSBnZXR0ZXh0IGlu
IGxpYmMuLi4geWVzCmNoZWNraW5nIHdoZXRoZXIgdG8gdXNlIE5MUy4uLiB5ZXMKY2hlY2tp
bmcgd2hlcmUgdGhlIGdldHRleHQgZnVuY3Rpb24gY29tZXMgZnJvbS4uLiBsaWJjCmNoZWNr
aW5nIGZvciBwa2ctY29uZmlnLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2VzdyB2aWEgcGtn
LWNvbmZpZy4uLiBubwpjaGVja2luZyBmb3IgbmN1cnNlc3cgdmlhIGZhbGxiYWNrLi4uCmNo
ZWNraW5nIGZvciBpbml0c2NyKCkgd2l0aCAtbG5jdXJzZXN3Li4uIHllcwpjaGVja2luZyBm
b3Igbm9kZWxheSgpIHdpdGggLWxuY3Vyc2Vzdy4uLiB5ZXMKY2hlY2tpbmcgZm9yIHdvcmtp
bmcgbmN1cnNlc3cvY3Vyc2VzLmguLi4geWVzCmNoZWNraW5nIGZvciB3b3JraW5nIG5jdXJz
ZXN3LmguLi4gbm8KY2hlY2tpbmcgZm9yIHdvcmtpbmcgbmN1cnNlcy5oLi4uIHllcwpjaGVj
a2luZyBmb3IgQ3Vyc2VzIFBhbmVsIGxpYnJhcnkgd2l0aCBuY3Vyc2Vzdy9wYW5lbC5oLi4u
IHllcwpjaGVja2luZyBmb3IgQ3Vyc2VzIE1lbnUgbGlicmFyeSB3aXRoIG5jdXJzZXN3L21l
bnUuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGJ1aWxkIHRpbWUuLi4gV2VkIEFwciAxMCAyMDoz
MTo1OSAyMDE5CmNoZWNraW5nIGlmIHRoZSBtYW51YWwgbmVlZHMgdG8gYmUgaW5zdGFsbGVk
Li4uIG5vCmNoZWNraW5nIHRoYXQgZ2VuZXJhdGVkIGZpbGVzIGFyZSBuZXdlciB0aGFuIGNv
bmZpZ3VyZS4uLiBkb25lCmNvbmZpZ3VyZTogY3JlYXRpbmcgLi9jb25maWcuc3RhdHVzCmNv
bmZpZy5zdGF0dXM6IGNyZWF0aW5nIE1ha2VmaWxlCmNvbmZpZy5zdGF0dXM6IGNyZWF0aW5n
IHBhdGhzLnNoCmNvbmZpZy5zdGF0dXM6IGNyZWF0aW5nIGtjb25maWcvTWFrZWZpbGUKY29u
ZmlnLnN0YXR1czogY3JlYXRpbmcgY29uZmlnL2NvbmZpZ3VyZS5pbgpjb25maWcuc3RhdHVz
OiBjcmVhdGluZyBjb25maWcuaApjb25maWcuc3RhdHVzOiBleGVjdXRpbmcgZGVwZmlsZXMg
Y29tbWFuZHMKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL2J1aWxkZXIvY3Jv
c3N0b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0LjAn
CiAgIGRlYmlhbi9ydWxlcyBvdmVycmlkZV9kaF9hdXRvX2J1aWxkCm1ha2VbMV06IEVudGVy
aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9j
cm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcKL3Vzci9iaW4vbWFrZQptYWtlWzJd
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2J1aWxkZXIvY3Jvc3N0b29sLW5nLW1pY3Jv
YmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0LjAnCi91c3IvYmluL21ha2Ug
IGFsbC1yZWN1cnNpdmUKbWFrZVszXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9idWls
ZGVyL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmct
MS4yNC4wJwpNYWtpbmcgYWxsIGluIGtjb25maWcKbWFrZVs0XTogRW50ZXJpbmcgZGlyZWN0
b3J5ICcvaG9tZS9idWlsZGVyL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1u
Zy1jcm9zc3Rvb2wtbmctMS4yNC4wL2tjb25maWcnCmJpc29uIC15IC1sIC1iIHpjb25mIC1w
IHpjb25mICAtb3pjb25mLmMgemNvbmYueQp6Y29uZi55OjM0LjEtNzogd2FybmluZzogUE9T
SVggWWFjYyBkb2VzIG5vdCBzdXBwb3J0ICVleHBlY3QgWy1XeWFjY10KICVleHBlY3QgMzIK
IF5+fn5+fn4KemNvbmYueTo5Ni4xLTExOiB3YXJuaW5nOiBQT1NJWCBZYWNjIGRvZXMgbm90
IHN1cHBvcnQgJWRlc3RydWN0b3IgWy1XeWFjY10KICVkZXN0cnVjdG9yIHsKIF5+fn5+fn5+
fn5+CmZsZXggLUwgLVB6Y29uZiAgLW96Y29uZi5sZXguYyB6Y29uZi5sCi91c3IvYmluL21h
a2UgIGFsbC1hbQptYWtlWzVdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2J1aWxkZXIv
Y3Jvc3N0b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0
LjAva2NvbmZpZycKZGVwYmFzZT1gZWNobyBjb25mLm8gfCBzZWQgJ3N8W14vXSokfC5kZXBz
LyZ8O3N8XC5vJHx8J2A7XApnY2MgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uICAtaW5jbHVk
ZSBjb25maWcuaCAtRENPTkZJR189XCJDVF9cIiAtV2RhdGUtdGltZSAtRF9GT1JUSUZZX1NP
VVJDRT0yICAtZyAtTzIgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2J1aWxkZXIvY3Jvc3N0
b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0LjA9LiAt
ZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLVdmb3JtYXQgLVdlcnJvcj1mb3JtYXQtc2VjdXJp
dHkgLU1UIGNvbmYubyAtTUQgLU1QIC1NRiAkZGVwYmFzZS5UcG8gLWMgLW8gY29uZi5vIGNv
bmYuYyAmJlwKbXYgLWYgJGRlcGJhc2UuVHBvICRkZXBiYXNlLlBvCmRlcGJhc2U9YGVjaG8g
emNvbmYubyB8IHNlZCAnc3xbXi9dKiR8LmRlcHMvJnw7c3xcLm8kfHwnYDtcCmdjYyAtREhB
VkVfQ09ORklHX0ggLUkuIC1JLi4gIC1pbmNsdWRlIGNvbmZpZy5oIC1EQ09ORklHXz1cIkNU
X1wiIC1XZGF0ZS10aW1lIC1EX0ZPUlRJRllfU09VUkNFPTIgIC1nIC1PMiAtZmRlYnVnLXBy
ZWZpeC1tYXA9L2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rv
b2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAt
V2Zvcm1hdCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtTVQgemNvbmYubyAtTUQgLU1QIC1N
RiAkZGVwYmFzZS5UcG8gLWMgLW8gemNvbmYubyB6Y29uZi5jICYmXAptdiAtZiAkZGVwYmFz
ZS5UcG8gJGRlcGJhc2UuUG8KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHpjb25mLmM6MjUxODoK
Y29uZmRhdGEuYzogSW4gZnVuY3Rpb24gJ2NvbmZfd3JpdGUnOgpjb25mZGF0YS5jOjc3Mzoy
Mjogd2FybmluZzogJyVzJyBkaXJlY3RpdmUgd3JpdGluZyBsaWtlbHkgNyBvciBtb3JlIGJ5
dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0
LW92ZXJmbG93PV0KICBzcHJpbnRmKG5ld25hbWUsICIlcyVzIiwgZGlybmFtZSwgYmFzZW5h
bWUpOwogICAgICAgICAgICAgICAgICAgICAgXn4KY29uZmRhdGEuYzo3NzM6MTk6IG5vdGU6
IGFzc3VtaW5nIGRpcmVjdGl2ZSBvdXRwdXQgb2YgNyBieXRlcwogIHNwcmludGYobmV3bmFt
ZSwgIiVzJXMiLCBkaXJuYW1lLCBiYXNlbmFtZSk7CiAgICAgICAgICAgICAgICAgICBefn5+
fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9zdGRpby5oOjg3MywKICAg
ICAgICAgICAgICAgICBmcm9tIHpjb25mLmM6ODY6Ci91c3IvaW5jbHVkZS94ODZfNjQtbGlu
dXgtZ251L2JpdHMvc3RkaW8yLmg6MzY6MTA6IG5vdGU6ICdfX2J1aWx0aW5fX19zcHJpbnRm
X2Noaycgb3V0cHV0IDEgb3IgbW9yZSBieXRlcyAoYXNzdW1pbmcgNDEwNCkgaW50byBhIGRl
c3RpbmF0aW9uIG9mIHNpemUgNDA5NwogICByZXR1cm4gX19idWlsdGluX19fc3ByaW50Zl9j
aGsgKF9fcywgX19VU0VfRk9SVElGWV9MRVZFTCAtIDEsCiAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgIF9f
Ym9zIChfX3MpLCBfX2ZtdCwgX192YV9hcmdfcGFjayAoKSk7CiAgICAgICB+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSB6Y29u
Zi5jOjI1MTg6CmNvbmZkYXRhLmM6Nzc2OjIzOiB3YXJuaW5nOiAnLnRtcGNvbmZpZy4nIGRp
cmVjdGl2ZSB3cml0aW5nIDExIGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVu
IDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KICAgc3ByaW50Zih0bXBuYW1lLCAi
JXMudG1wY29uZmlnLiVkIiwgZGlybmFtZSwgKGludClnZXRwaWQoKSk7CiAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5j
bHVkZS9zdGRpby5oOjg3MywKICAgICAgICAgICAgICAgICBmcm9tIHpjb25mLmM6ODY6Ci91
c3IvaW5jbHVkZS94ODZfNjQtbGludXgtZ251L2JpdHMvc3RkaW8yLmg6MzY6MTA6IG5vdGU6
ICdfX2J1aWx0aW5fX19zcHJpbnRmX2Noaycgb3V0cHV0IGJldHdlZW4gMTMgYW5kIDQxMTkg
Ynl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgNDA5NwogICByZXR1cm4gX19idWls
dGluX19fc3ByaW50Zl9jaGsgKF9fcywgX19VU0VfRk9SVElGWV9MRVZFTCAtIDEsCiAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KICAgICAgIF9fYm9zIChfX3MpLCBfX2ZtdCwgX192YV9hcmdfcGFjayAoKSk7CiAg
ICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Ci91c3IvYmluL2xp
YnRvb2wgIC0tdGFnIENDICAtLW1vZGU9bGluayBnY2MgIC1nIC1PMiAtZmRlYnVnLXByZWZp
eC1tYXA9L2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wt
bmctY3Jvc3N0b29sLW5nLTEuMjQuMD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtV2Zv
cm1hdCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAgLVdsLC16LHJlbHJvIC1vIGNvbmYgY29u
Zi5vIHpjb25mLm8KbGlidG9vbDogbGluazogZ2NjIC1nIC1PMiAtZmRlYnVnLXByZWZpeC1t
YXA9L2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmct
Y3Jvc3N0b29sLW5nLTEuMjQuMD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtV2Zvcm1h
dCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtV2wsLXogLVdsLHJlbHJvIC1vIGNvbmYgY29u
Zi5vIHpjb25mLm8KZ2NjIC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAgLWluY2x1ZGUgY29u
ZmlnLmggLURDT05GSUdfPVwiQ1RfXCIgLVdkYXRlLXRpbWUgLURfRk9SVElGWV9TT1VSQ0U9
MiAtRF9HTlVfU09VUkNFICAtZyAtTzIgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2J1aWxk
ZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0x
LjI0LjA9LiAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLVdmb3JtYXQgLVdlcnJvcj1mb3Jt
YXQtc2VjdXJpdHkgLU1UIG5jb25mLW5jb25mLm8gLU1EIC1NUCAtTUYgLmRlcHMvbmNvbmYt
bmNvbmYuVHBvIC1jIC1vIG5jb25mLW5jb25mLm8gYHRlc3QgLWYgJ25jb25mLmMnIHx8IGVj
aG8gJy4vJ2BuY29uZi5jCm12IC1mIC5kZXBzL25jb25mLW5jb25mLlRwbyAuZGVwcy9uY29u
Zi1uY29uZi5QbwpnY2MgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uICAtaW5jbHVkZSBjb25m
aWcuaCAtRENPTkZJR189XCJDVF9cIiAtV2RhdGUtdGltZSAtRF9GT1JUSUZZX1NPVVJDRT0y
IC1EX0dOVV9TT1VSQ0UgIC1nIC1PMiAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvYnVpbGRl
ci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEu
MjQuMD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtV2Zvcm1hdCAtV2Vycm9yPWZvcm1h
dC1zZWN1cml0eSAtTVQgbmNvbmYtbmNvbmYuZ3VpLm8gLU1EIC1NUCAtTUYgLmRlcHMvbmNv
bmYtbmNvbmYuZ3VpLlRwbyAtYyAtbyBuY29uZi1uY29uZi5ndWkubyBgdGVzdCAtZiAnbmNv
bmYuZ3VpLmMnIHx8IGVjaG8gJy4vJ2BuY29uZi5ndWkuYwptdiAtZiAuZGVwcy9uY29uZi1u
Y29uZi5ndWkuVHBvIC5kZXBzL25jb25mLW5jb25mLmd1aS5QbwpnY2MgLURIQVZFX0NPTkZJ
R19IIC1JLiAtSS4uICAtaW5jbHVkZSBjb25maWcuaCAtRENPTkZJR189XCJDVF9cIiAtV2Rh
dGUtdGltZSAtRF9GT1JUSUZZX1NPVVJDRT0yIC1EX0dOVV9TT1VSQ0UgIC1nIC1PMiAtZmRl
YnVnLXByZWZpeC1tYXA9L2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9j
cm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0
cm9uZyAtV2Zvcm1hdCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtTVQgbmNvbmYtemNvbmYu
byAtTUQgLU1QIC1NRiAuZGVwcy9uY29uZi16Y29uZi5UcG8gLWMgLW8gbmNvbmYtemNvbmYu
byBgdGVzdCAtZiAnemNvbmYuYycgfHwgZWNobyAnLi8nYHpjb25mLmMKSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIHpjb25mLmM6MjUxODoKY29uZmRhdGEuYzogSW4gZnVuY3Rpb24gJ2NvbmZf
d3JpdGUnOgpjb25mZGF0YS5jOjc3MzoyMjogd2FybmluZzogJyVzJyBkaXJlY3RpdmUgd3Jp
dGluZyBsaWtlbHkgNyBvciBtb3JlIGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3
ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KICBzcHJpbnRmKG5ld25hbWUs
ICIlcyVzIiwgZGlybmFtZSwgYmFzZW5hbWUpOwogICAgICAgICAgICAgICAgICAgICAgXn4K
Y29uZmRhdGEuYzo3NzM6MTk6IG5vdGU6IGFzc3VtaW5nIGRpcmVjdGl2ZSBvdXRwdXQgb2Yg
NyBieXRlcwogIHNwcmludGYobmV3bmFtZSwgIiVzJXMiLCBkaXJuYW1lLCBiYXNlbmFtZSk7
CiAgICAgICAgICAgICAgICAgICBefn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3Iv
aW5jbHVkZS9zdGRpby5oOjg3MywKICAgICAgICAgICAgICAgICBmcm9tIHpjb25mLmM6ODY6
Ci91c3IvaW5jbHVkZS94ODZfNjQtbGludXgtZ251L2JpdHMvc3RkaW8yLmg6MzY6MTA6IG5v
dGU6ICdfX2J1aWx0aW5fX19zcHJpbnRmX2Noaycgb3V0cHV0IDEgb3IgbW9yZSBieXRlcyAo
YXNzdW1pbmcgNDEwNCkgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgNDA5NwogICByZXR1
cm4gX19idWlsdGluX19fc3ByaW50Zl9jaGsgKF9fcywgX19VU0VfRk9SVElGWV9MRVZFTCAt
IDEsCiAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KICAgICAgIF9fYm9zIChfX3MpLCBfX2ZtdCwgX192YV9hcmdfcGFj
ayAoKSk7CiAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cklu
IGZpbGUgaW5jbHVkZWQgZnJvbSB6Y29uZi5jOjI1MTg6CmNvbmZkYXRhLmM6Nzc2OjIzOiB3
YXJuaW5nOiAnLnRtcGNvbmZpZy4nIGRpcmVjdGl2ZSB3cml0aW5nIDExIGJ5dGVzIGludG8g
YSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93
PV0KICAgc3ByaW50Zih0bXBuYW1lLCAiJXMudG1wY29uZmlnLiVkIiwgZGlybmFtZSwgKGlu
dClnZXRwaWQoKSk7CiAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9zdGRpby5oOjg3MywKICAgICAgICAgICAg
ICAgICBmcm9tIHpjb25mLmM6ODY6Ci91c3IvaW5jbHVkZS94ODZfNjQtbGludXgtZ251L2Jp
dHMvc3RkaW8yLmg6MzY6MTA6IG5vdGU6ICdfX2J1aWx0aW5fX19zcHJpbnRmX2Noaycgb3V0
cHV0IGJldHdlZW4gMTMgYW5kIDQxMTkgYnl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNp
emUgNDA5NwogICByZXR1cm4gX19idWlsdGluX19fc3ByaW50Zl9jaGsgKF9fcywgX19VU0Vf
Rk9SVElGWV9MRVZFTCAtIDEsCiAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgIF9fYm9zIChfX3MpLCBfX2Zt
dCwgX192YV9hcmdfcGFjayAoKSk7CiAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cm12IC1mIC5kZXBzL25jb25mLXpjb25mLlRwbyAuZGVwcy9uY29uZi16
Y29uZi5QbwovdXNyL2Jpbi9saWJ0b29sICAtLXRhZyBDQyAgLS1tb2RlPWxpbmsgZ2NjIC1E
X0dOVV9TT1VSQ0UgIC1nIC1PMiAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvYnVpbGRlci9j
cm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQu
MD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtV2Zvcm1hdCAtV2Vycm9yPWZvcm1hdC1z
ZWN1cml0eSAgLVdsLC16LHJlbHJvIC1vIG5jb25mIG5jb25mLW5jb25mLm8gbmNvbmYtbmNv
bmYuZ3VpLm8gbmNvbmYtemNvbmYubyAtbG1lbnV3IC1scGFuZWx3IC1sbmN1cnNlc3cKbGli
dG9vbDogbGluazogZ2NjIC1EX0dOVV9TT1VSQ0UgLWcgLU8yIC1mZGVidWctcHJlZml4LW1h
cD0vaG9tZS9idWlsZGVyL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1j
cm9zc3Rvb2wtbmctMS4yNC4wPS4gLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1XZm9ybWF0
IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC1XbCwteiAtV2wscmVscm8gLW8gbmNvbmYgbmNv
bmYtbmNvbmYubyBuY29uZi1uY29uZi5ndWkubyBuY29uZi16Y29uZi5vICAtbG1lbnV3IC1s
cGFuZWx3IC1sbmN1cnNlc3cKZGVwYmFzZT1gZWNobyBtY29uZi5vIHwgc2VkICdzfFteL10q
JHwuZGVwcy8mfDtzfFwubyR8fCdgO1wKZ2NjIC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAg
LWluY2x1ZGUgY29uZmlnLmggLURDT05GSUdfPVwiQ1RfXCIgLVdkYXRlLXRpbWUgLURfRk9S
VElGWV9TT1VSQ0U9MiAgLWcgLU8yIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9idWlsZGVy
L2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmctMS4y
NC4wPS4gLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0
LXNlY3VyaXR5IC1NVCBtY29uZi5vIC1NRCAtTVAgLU1GICRkZXBiYXNlLlRwbyAtYyAtbyBt
Y29uZi5vIG1jb25mLmMgJiZcCm12IC1mICRkZXBiYXNlLlRwbyAkZGVwYmFzZS5QbwpkZXBi
YXNlPWBlY2hvIGx4ZGlhbG9nL2NoZWNrbGlzdC5vIHwgc2VkICdzfFteL10qJHwuZGVwcy8m
fDtzfFwubyR8fCdgO1wKZ2NjIC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAgLWluY2x1ZGUg
Y29uZmlnLmggLURDT05GSUdfPVwiQ1RfXCIgLVdkYXRlLXRpbWUgLURfRk9SVElGWV9TT1VS
Q0U9MiAgLWcgLU8yIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9idWlsZGVyL2Nyb3NzdG9v
bC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmctMS4yNC4wPS4gLWZz
dGFjay1wcm90ZWN0b3Itc3Ryb25nIC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5
IC1NVCBseGRpYWxvZy9jaGVja2xpc3QubyAtTUQgLU1QIC1NRiAkZGVwYmFzZS5UcG8gLWMg
LW8gbHhkaWFsb2cvY2hlY2tsaXN0Lm8gbHhkaWFsb2cvY2hlY2tsaXN0LmMgJiZcCm12IC1m
ICRkZXBiYXNlLlRwbyAkZGVwYmFzZS5QbwpkZXBiYXNlPWBlY2hvIGx4ZGlhbG9nL2lucHV0
Ym94Lm8gfCBzZWQgJ3N8W14vXSokfC5kZXBzLyZ8O3N8XC5vJHx8J2A7XApnY2MgLURIQVZF
X0NPTkZJR19IIC1JLiAtSS4uICAtaW5jbHVkZSBjb25maWcuaCAtRENPTkZJR189XCJDVF9c
IiAtV2RhdGUtdGltZSAtRF9GT1JUSUZZX1NPVVJDRT0yICAtZyAtTzIgLWZkZWJ1Zy1wcmVm
aXgtbWFwPS9ob21lL2J1aWxkZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29s
LW5nLWNyb3NzdG9vbC1uZy0xLjI0LjA9LiAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLVdm
b3JtYXQgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLU1UIGx4ZGlhbG9nL2lucHV0Ym94Lm8g
LU1EIC1NUCAtTUYgJGRlcGJhc2UuVHBvIC1jIC1vIGx4ZGlhbG9nL2lucHV0Ym94Lm8gbHhk
aWFsb2cvaW5wdXRib3guYyAmJlwKbXYgLWYgJGRlcGJhc2UuVHBvICRkZXBiYXNlLlBvCmRl
cGJhc2U9YGVjaG8gbHhkaWFsb2cvbWVudWJveC5vIHwgc2VkICdzfFteL10qJHwuZGVwcy8m
fDtzfFwubyR8fCdgO1wKZ2NjIC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAgLWluY2x1ZGUg
Y29uZmlnLmggLURDT05GSUdfPVwiQ1RfXCIgLVdkYXRlLXRpbWUgLURfRk9SVElGWV9TT1VS
Q0U9MiAgLWcgLU8yIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9idWlsZGVyL2Nyb3NzdG9v
bC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmctMS4yNC4wPS4gLWZz
dGFjay1wcm90ZWN0b3Itc3Ryb25nIC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5
IC1NVCBseGRpYWxvZy9tZW51Ym94Lm8gLU1EIC1NUCAtTUYgJGRlcGJhc2UuVHBvIC1jIC1v
IGx4ZGlhbG9nL21lbnVib3gubyBseGRpYWxvZy9tZW51Ym94LmMgJiZcCm12IC1mICRkZXBi
YXNlLlRwbyAkZGVwYmFzZS5QbwpkZXBiYXNlPWBlY2hvIGx4ZGlhbG9nL3RleHRib3gubyB8
IHNlZCAnc3xbXi9dKiR8LmRlcHMvJnw7c3xcLm8kfHwnYDtcCmdjYyAtREhBVkVfQ09ORklH
X0ggLUkuIC1JLi4gIC1pbmNsdWRlIGNvbmZpZy5oIC1EQ09ORklHXz1cIkNUX1wiIC1XZGF0
ZS10aW1lIC1EX0ZPUlRJRllfU09VUkNFPTIgIC1nIC1PMiAtZmRlYnVnLXByZWZpeC1tYXA9
L2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jv
c3N0b29sLW5nLTEuMjQuMD0uIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtV2Zvcm1hdCAt
V2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtTVQgbHhkaWFsb2cvdGV4dGJveC5vIC1NRCAtTVAg
LU1GICRkZXBiYXNlLlRwbyAtYyAtbyBseGRpYWxvZy90ZXh0Ym94Lm8gbHhkaWFsb2cvdGV4
dGJveC5jICYmXAptdiAtZiAkZGVwYmFzZS5UcG8gJGRlcGJhc2UuUG8KZGVwYmFzZT1gZWNo
byBseGRpYWxvZy91dGlsLm8gfCBzZWQgJ3N8W14vXSokfC5kZXBzLyZ8O3N8XC5vJHx8J2A7
XApnY2MgLURIQVZFX0NPTkZJR19IIC1JLiAtSS4uICAtaW5jbHVkZSBjb25maWcuaCAtRENP
TkZJR189XCJDVF9cIiAtV2RhdGUtdGltZSAtRF9GT1JUSUZZX1NPVVJDRT0yICAtZyAtTzIg
LWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2J1aWxkZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxh
emUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0LjA9LiAtZnN0YWNrLXByb3RlY3Rv
ci1zdHJvbmcgLVdmb3JtYXQgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLU1UIGx4ZGlhbG9n
L3V0aWwubyAtTUQgLU1QIC1NRiAkZGVwYmFzZS5UcG8gLWMgLW8gbHhkaWFsb2cvdXRpbC5v
IGx4ZGlhbG9nL3V0aWwuYyAmJlwKbXYgLWYgJGRlcGJhc2UuVHBvICRkZXBiYXNlLlBvCmRl
cGJhc2U9YGVjaG8gbHhkaWFsb2cveWVzbm8ubyB8IHNlZCAnc3xbXi9dKiR8LmRlcHMvJnw7
c3xcLm8kfHwnYDtcCmdjYyAtREhBVkVfQ09ORklHX0ggLUkuIC1JLi4gIC1pbmNsdWRlIGNv
bmZpZy5oIC1EQ09ORklHXz1cIkNUX1wiIC1XZGF0ZS10aW1lIC1EX0ZPUlRJRllfU09VUkNF
PTIgIC1nIC1PMiAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wt
bmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMD0uIC1mc3Rh
Y2stcHJvdGVjdG9yLXN0cm9uZyAtV2Zvcm1hdCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAt
TVQgbHhkaWFsb2cveWVzbm8ubyAtTUQgLU1QIC1NRiAkZGVwYmFzZS5UcG8gLWMgLW8gbHhk
aWFsb2cveWVzbm8ubyBseGRpYWxvZy95ZXNuby5jICYmXAptdiAtZiAkZGVwYmFzZS5UcG8g
JGRlcGJhc2UuUG8KL3Vzci9iaW4vbGlidG9vbCAgLS10YWcgQ0MgIC0tbW9kZT1saW5rIGdj
YyAgLWcgLU8yIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9idWlsZGVyL2Nyb3NzdG9vbC1u
Zy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmctMS4yNC4wPS4gLWZzdGFj
ay1wcm90ZWN0b3Itc3Ryb25nIC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5ICAt
V2wsLXoscmVscm8gLW8gbWNvbmYgbWNvbmYubyB6Y29uZi5vIGx4ZGlhbG9nL2NoZWNrbGlz
dC5vIGx4ZGlhbG9nL2lucHV0Ym94Lm8gbHhkaWFsb2cvbWVudWJveC5vIGx4ZGlhbG9nL3Rl
eHRib3gubyBseGRpYWxvZy91dGlsLm8gbHhkaWFsb2cveWVzbm8ubyAtbG5jdXJzZXN3Cmxp
YnRvb2w6IGxpbms6IGdjYyAtZyAtTzIgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2J1aWxk
ZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0x
LjI0LjA9LiAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLVdmb3JtYXQgLVdlcnJvcj1mb3Jt
YXQtc2VjdXJpdHkgLVdsLC16IC1XbCxyZWxybyAtbyBtY29uZiBtY29uZi5vIHpjb25mLm8g
bHhkaWFsb2cvY2hlY2tsaXN0Lm8gbHhkaWFsb2cvaW5wdXRib3gubyBseGRpYWxvZy9tZW51
Ym94Lm8gbHhkaWFsb2cvdGV4dGJveC5vIGx4ZGlhbG9nL3V0aWwubyBseGRpYWxvZy95ZXNu
by5vICAtbG5jdXJzZXN3Cm1ha2VbNV06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9idWls
ZGVyL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmct
MS4yNC4wL2tjb25maWcnCm1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9idWls
ZGVyL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmct
MS4yNC4wL2tjb25maWcnCm1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVp
bGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5n
LTEuMjQuMCcKKCAvdXNyL2Jpbi9zZWQgLWUgJ3MsW0BdZG9jZGlyW0BdLC91c3IvbG9jYWwv
c2hhcmUvZG9jL2Nyb3NzdG9vbC1uZyxnJyAtZSAncyxbQF1wa2dkYXRhZGlyW0BdLC91c3Iv
bG9jYWwvc2hhcmUvY3Jvc3N0b29sLW5nLGcnIC1lICdzLFtAXXBrZ2xpYmV4ZWNkaXJbQF0s
L3Vzci9sb2NhbC9saWJleGVjL2Nyb3NzdG9vbC1uZyxnJyAtZSAncyxbQF1wcm9nbmFtZVtA
XSwnYGVjaG8gY3QtbmcgfCBzZWQgJ3MseCx4LCdgJyxnJyB8IC9iaW4vYmFzaCBjb25maWcu
c3RhdHVzIC0tZmlsZT0tICkgPCBjdC1uZy5pbiA+Y3QtbmctdCAmJiBjaG1vZCBhLXcsYSt4
IGN0LW5nLXQgJiYgbXYgLWYgY3QtbmctdCBjdC1uZwovdXNyL2Jpbi9ta2RpciAtcCBiYXNo
LWNvbXBsZXRpb24gJiYgKCAvdXNyL2Jpbi9zZWQgLWUgJ3MsW0BdZG9jZGlyW0BdLC91c3Iv
bG9jYWwvc2hhcmUvZG9jL2Nyb3NzdG9vbC1uZyxnJyAtZSAncyxbQF1wa2dkYXRhZGlyW0Bd
LC91c3IvbG9jYWwvc2hhcmUvY3Jvc3N0b29sLW5nLGcnIC1lICdzLFtAXXBrZ2xpYmV4ZWNk
aXJbQF0sL3Vzci9sb2NhbC9saWJleGVjL2Nyb3NzdG9vbC1uZyxnJyAtZSAncyxbQF1wcm9n
bmFtZVtAXSwnYGVjaG8gY3QtbmcgfCBzZWQgJ3MseCx4LCdgJyxnJyB8IC9iaW4vYmFzaCBj
b25maWcuc3RhdHVzIC0tZmlsZT0tICkgPCBiYXNoLWNvbXBsZXRpb24vY3QtbmcuaW4gPmJh
c2gtY29tcGxldGlvbi9jdC1uZy10ICYmIG12IC1mIGJhc2gtY29tcGxldGlvbi9jdC1uZy10
IGJhc2gtY29tcGxldGlvbi9jdC1uZwovdXNyL2Jpbi9ta2RpciAtcCBkb2NzICYmICggL3Vz
ci9iaW4vc2VkIC1lICdzLFtAXWRvY2RpcltAXSwvdXNyL2xvY2FsL3NoYXJlL2RvYy9jcm9z
c3Rvb2wtbmcsZycgLWUgJ3MsW0BdcGtnZGF0YWRpcltAXSwvdXNyL2xvY2FsL3NoYXJlL2Ny
b3NzdG9vbC1uZyxnJyAtZSAncyxbQF1wa2dsaWJleGVjZGlyW0BdLC91c3IvbG9jYWwvbGli
ZXhlYy9jcm9zc3Rvb2wtbmcsZycgLWUgJ3MsW0BdcHJvZ25hbWVbQF0sJ2BlY2hvIGN0LW5n
IHwgc2VkICdzLHgseCwnYCcsZycgfCAvYmluL2Jhc2ggY29uZmlnLnN0YXR1cyAtLWZpbGU9
LSApIDwgZG9jcy9jdC1uZy4xLmluID5kb2NzL2N0LW5nLjEtdCAmJiBtdiAtZiBkb2NzL2N0
LW5nLjEtdCBkb2NzL2N0LW5nLjEKbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21l
L2J1aWxkZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUvY3Jvc3N0b29sLW5nLWNyb3NzdG9v
bC1uZy0xLjI0LjAnCm1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9idWlsZGVy
L2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmctMS4y
NC4wJwptYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9jcm9zc3Rv
b2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcKLi9j
dC1uZyBkZWZjb25maWcKbWFrZVsyXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9idWls
ZGVyL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Nyb3NzdG9vbC1uZy1jcm9zc3Rvb2wtbmct
MS4yNC4wJwogIENPTkYgIGRlZmNvbmZpZwojCiMgY29uZmlndXJhdGlvbiB3cml0dGVuIHRv
IC5jb25maWcKIwptYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9j
cm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9jcm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQu
MCcKdW5zZXQgQ0ZMQUdTIENYWEZMQUdTOyAuL2N0LW5nIGJ1aWxkCm1ha2VbMl06IEVudGVy
aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9j
cm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcKW0lORk8gXSAgUGVyZm9ybWluZyBz
b21lIHRyaXZpYWwgc2FuaXR5IGNoZWNrcwpbV0FSTiBdICBOdW1iZXIgb2Ygb3BlbiBmaWxl
cyAxMDI0IG1heSBub3QgYmUgc3VmZmljaWVudCB0byBidWlsZCB0aGUgdG9vbGNoYWluOyBp
bmNyZWFzaW5nIHRvIDIwNDgKW0lORk8gXSAgQnVpbGQgc3RhcnRlZCAyMDIxMTAyMC4wMTU1
NTkKW0lORk8gXSAgQnVpbGRpbmcgZW52aXJvbm1lbnQgdmFyaWFibGVzCltFWFRSQV0gIFBy
ZXBhcmluZyB3b3JraW5nIGRpcmVjdG9yaWVzCltFWFRSQV0gIEluc3RhbGxpbmcgdXNlci1z
dXBwbGllZCBjcm9zc3Rvb2wtTkcgY29uZmlndXJhdGlvbgpbRVhUUkFdICA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQpbRVhUUkFdICBEdW1waW5nIGludGVybmFsIGNyb3NzdG9vbC1ORyBjb25maWd1cmF0aW9u
CltFWFRSQV0gICAgQnVpbGRpbmcgYSB0b29sY2hhaW4gZm9yOgpbRVhUUkFdICAgICAgYnVp
bGQgID0geDg2XzY0LXBjLWxpbnV4LWdudQpbRVhUUkFdICAgICAgaG9zdCAgID0geDg2XzY0
LXBjLWxpbnV4LWdudQpbRVhUUkFdICAgICAgdGFyZ2V0ID0gbWljcm9ibGF6ZWVsLWNyb3Nz
dG9vbC1lbGYKW0VYVFJBXSAgRHVtcGluZyBpbnRlcm5hbCBjcm9zc3Rvb2wtTkcgY29uZmln
dXJhdGlvbjogZG9uZSBpbiAwLjI5cyAoYXQgMDA6MTQpCltJTkZPIF0gID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CltJTkZPIF0gIFJldHJpZXZpbmcgbmVlZGVkIHRvb2xjaGFpbiBjb21wb25lbnRzJyB0YXJi
YWxscwpbRVhUUkFdICAgIFJldHJpZXZpbmcgJ3psaWItMS4yLjExJwpbRVhUUkFdICAgIFZl
cmlmeWluZyBTSEE1MTIgY2hlY2tzdW0gZm9yICd6bGliLTEuMi4xMS50YXIueHonCltFWFRS
QV0gICAgU2F2aW5nICd6bGliLTEuMi4xMS50YXIueHonIHRvIGxvY2FsIHN0b3JhZ2UKW0VY
VFJBXSAgICBSZXRyaWV2aW5nICdnbXAtNi4xLjInCltFWFRSQV0gICAgVmVyaWZ5aW5nIFNI
QTUxMiBjaGVja3N1bSBmb3IgJ2dtcC02LjEuMi50YXIueHonCltFWFRSQV0gICAgU2F2aW5n
ICdnbXAtNi4xLjIudGFyLnh6JyB0byBsb2NhbCBzdG9yYWdlCltFWFRSQV0gICAgUmV0cmll
dmluZyAnbXBmci00LjAuMicKW0VYVFJBXSAgICBWZXJpZnlpbmcgU0hBNTEyIGNoZWNrc3Vt
IGZvciAnbXBmci00LjAuMi50YXIueHonCltFWFRSQV0gICAgU2F2aW5nICdtcGZyLTQuMC4y
LnRhci54eicgdG8gbG9jYWwgc3RvcmFnZQpbRVhUUkFdICAgIFJldHJpZXZpbmcgJ2lzbC0w
LjIwJwpbRVJST1JdICAgIGlzbDogZG93bmxvYWQgZmFpbGVkCltFUlJPUl0KW0VSUk9SXSAg
Pj4KW0VSUk9SXSAgPj4gIEJ1aWxkIGZhaWxlZCBpbiBzdGVwICdSZXRyaWV2aW5nIG5lZWRl
ZCB0b29sY2hhaW4gY29tcG9uZW50cycgdGFyYmFsbHMnCltFUlJPUl0gID4+ICAgICAgICBj
YWxsZWQgaW4gc3RlcCAnKHRvcC1sZXZlbCknCltFUlJPUl0gID4+CltFUlJPUl0gID4+ICBF
cnJvciBoYXBwZW5lZCBpbjogQ1RfQWJvcnRbc2NyaXB0cy9mdW5jdGlvbnNANDg3XQpbRVJS
T1JdICA+PiAgICAgICAgY2FsbGVkIGZyb206IENUX0RvRmV0Y2hbc2NyaXB0cy9mdW5jdGlv
bnNAMjEwM10KW0VSUk9SXSAgPj4gICAgICAgIGNhbGxlZCBmcm9tOiBDVF9QYWNrYWdlUnVu
W3NjcmlwdHMvZnVuY3Rpb25zQDIwNjNdCltFUlJPUl0gID4+ICAgICAgICBjYWxsZWQgZnJv
bTogQ1RfRmV0Y2hbc2NyaXB0cy9mdW5jdGlvbnNAMjE3NF0KW0VSUk9SXSAgPj4gICAgICAg
IGNhbGxlZCBmcm9tOiBkb19pc2xfZ2V0W3NjcmlwdHMvYnVpbGQvY29tcGFuaW9uX2xpYnMv
MTIxLWlzbC5zaEAxNl0KW0VSUk9SXSAgPj4gICAgICAgIGNhbGxlZCBmcm9tOiBkb19jb21w
YW5pb25fbGlic19nZXRbc2NyaXB0cy9idWlsZC9jb21wYW5pb25fbGlicy5zaEAxNV0KW0VS
Uk9SXSAgPj4gICAgICAgIGNhbGxlZCBmcm9tOiBtYWluW3NjcmlwdHMvY3Jvc3N0b29sLU5H
LnNoQDY0OF0KW0VSUk9SXSAgPj4KW0VSUk9SXSAgPj4gIFRoZXJlIGlzIGEgbGlzdCBvZiBr
bm93biBpc3N1ZXMsIHNvbWUgd2l0aCB3b3JrYXJvdW5kcywgaW46CltFUlJPUl0gID4+ICAg
ICAgaHR0cHM6Ly9jcm9zc3Rvb2wtbmcuZ2l0aHViLmlvL2RvY3Mva25vd24taXNzdWVzLwpb
RVJST1JdICA+PgpbRVJST1JdICA+PiBOT1RFOiBZb3VyIGNvbmZpZ3VyYXRpb24gaW5jbHVk
ZXMgZmVhdHVyZXMgbWFya2VkIEVYUEVSSU1FTlRBTC4KW0VSUk9SXSAgPj4gQmVmb3JlIHN1
Ym1pdHRpbmcgYSBidWcgcmVwb3J0LCB0cnkgdG8gcmVwcm9kdWNlIGl0IHdpdGhvdXQgZW5h
YmxpbmcKW0VSUk9SXSAgPj4gYW55IGV4cGVyaW1lbnRhbCBmZWF0dXJlcy4gT3RoZXJ3aXNl
LCB5b3UnbGwgbmVlZCB0byBkZWJ1ZyBpdApbRVJST1JdICA+PiBhbmQgcHJlc2VudCBhbiBl
eHBsYW5hdGlvbiB3aHkgaXQgaXMgYSBidWcgaW4gY3Jvc3N0b29sLU5HIC0gb3IKW0VSUk9S
XSAgPj4gcHJlZmVyYWJseSwgYSBmaXguCltFUlJPUl0gID4+CltFUlJPUl0gID4+ICBJZiB5
b3UgZmVlbCB0aGlzIGlzIGEgYnVnIGluIGNyb3NzdG9vbC1ORywgcmVwb3J0IGl0IGF0Ogpb
RVJST1JdICA+PiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9jcm9zc3Rvb2wtbmcvY3Jvc3N0
b29sLW5nL2lzc3Vlcy8KW0VSUk9SXSAgPj4KW0VSUk9SXSAgPj4gIE1ha2Ugc3VyZSB5b3Vy
IHJlcG9ydCBpbmNsdWRlcyBhbGwgdGhlIGluZm9ybWF0aW9uIHBlcnRpbmVudCB0byB0aGlz
IGlzc3VlLgpbRVJST1JdICA+PiAgUmVhZCB0aGUgYnVnIHJlcG9ydGluZyBndWlkZWxpbmVz
IGhlcmU6CltFUlJPUl0gID4+ICAgICAgaHR0cDovL2Nyb3NzdG9vbC1uZy5naXRodWIuaW8v
c3VwcG9ydC8KW0VSUk9SXQpbRVJST1JdICAoZWxhcHNlZDogMTo1Mi45OCkKWzAxOjU5XSAv
IG1ha2VbMl06ICoqKiBbY3Qtbmc6MjYxOiBidWlsZF0gRXJyb3IgMQptYWtlWzJdOiBMZWF2
aW5nIGRpcmVjdG9yeSAnL2hvbWUvYnVpbGRlci9jcm9zc3Rvb2wtbmctbWljcm9ibGF6ZS9j
cm9zc3Rvb2wtbmctY3Jvc3N0b29sLW5nLTEuMjQuMCcKbWFrZVsxXTogKioqIFtkZWJpYW4v
cnVsZXM6MjM6IG92ZXJyaWRlX2RoX2F1dG9fYnVpbGRdIEVycm9yIDIKbWFrZVsxXTogTGVh
dmluZyBkaXJlY3RvcnkgJy9ob21lL2J1aWxkZXIvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUv
Y3Jvc3N0b29sLW5nLWNyb3NzdG9vbC1uZy0xLjI0LjAnCm1ha2U6ICoqKiBbZGViaWFuL3J1
bGVzOjM4OiBidWlsZF0gRXJyb3IgMgpkcGtnLWJ1aWxkcGFja2FnZTogZXJyb3I6IGRlYmlh
bi9ydWxlcyBidWlsZCBzdWJwcm9jZXNzIHJldHVybmVkIGV4aXQgc3RhdHVzIDIKV0FSTklO
RzogZXhpdCBjb2RlIDIgZnJvbSBhIHNoZWxsIGNvbW1hbmQuCgoKRVJST1I6IExvZ2ZpbGUg
b2YgZmFpbHVyZSBzdG9yZWQgaW46IC93b3JrL2J1aWxkL3RtcC93b3JrL2phaWxob3VzZS1k
ZW1vLWFybTY0L2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplLzEuMjQuMC1yMC90ZW1wL2xvZy5k
b19kcGtnX2J1aWxkLjM2MDU1CkVSUk9SOiBUYXNrIChtYzp1bHRyYTk2LXYyLWphaWxob3Vz
ZS1kZW1vOi9yZXBvL3JlY2lwZXMtZGV2dG9vbHMvY3Jvc3N0b29sLW5nLW1pY3JvYmxhemUv
Y3Jvc3N0b29sLW5nLW1pY3JvYmxhemVfMS4yNC4wLmJiOmRvX2Rwa2dfYnVpbGQpIGZhaWxl
ZCB3aXRoIGV4aXQgY29kZSAnMScKTk9URTogVGFza3MgU3VtbWFyeTogQXR0ZW1wdGVkIDE0
NyB0YXNrcyBvZiB3aGljaCAwIGRpZG4ndCBuZWVkIHRvIGJlIHJlcnVuIGFuZCAxIGZhaWxl
ZC4KClN1bW1hcnk6IDEgdGFzayBmYWlsZWQ6CiAgbWM6dWx0cmE5Ni12Mi1qYWlsaG91c2Ut
ZGVtbzovcmVwby9yZWNpcGVzLWRldnRvb2xzL2Nyb3NzdG9vbC1uZy1taWNyb2JsYXplL2Ny
b3NzdG9vbC1uZy1taWNyb2JsYXplXzEuMjQuMC5iYjpkb19kcGtnX2J1aWxkClN1bW1hcnk6
IFRoZXJlIHdhcyAxIEVSUk9SIG1lc3NhZ2Ugc2hvd24sIHJldHVybmluZyBhIG5vbi16ZXJv
IGV4aXQgY29kZS4KMjAyMS0xMC0yMCAwMjoyMjozMSAtIEVSUk9SICAgIC0gQ29tbWFuZCBy
ZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAxCg==
--------------220B5068223F869574C10D90--
