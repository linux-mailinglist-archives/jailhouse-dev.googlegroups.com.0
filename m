Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBF5T32AQMGQEPX52LCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 72755324FE2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Feb 2021 13:35:36 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id t6sf116911qkt.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Feb 2021 04:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iSeeVmtABzNowDf5F46SaBMcGmw9fYRuGG/Tat8lx/M=;
        b=lzrjX+gulKIor3b2jGtqdKRjCcUOX9zyNFGqfHXsYZZch090ruOrpY5hXcg8O0GU9z
         rs0QIWybZwoc43oD3gZYgHL4PiONvrjYyYuSRkCLtWQYmUhT/EtPLf1a4W/H+bluRbH6
         crxublmmYJklgIVgd0wXonlkJdVAj9tHTJuD6qwk01ByBWZPk1+qK8UHT3a9nGLXmZd4
         CyPqITGING16GtjwkXeCsmCRh9dk2vu3nT6wYrg0s1tAaDMZCMlfJfGqGHslyqY/ybMh
         fLAeeDfRIdej/2R5iopJMJgiSl0o1ChCImYKTLnWvxqqm43RoysOOKaXq1g7HtHeu6Xm
         dLaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iSeeVmtABzNowDf5F46SaBMcGmw9fYRuGG/Tat8lx/M=;
        b=UrHZ4vUM68Ncax0AZY0uaNftNtMg0HNGguVNp987j4VU4LjMK7b2kDJb4xmP5G7BZe
         tKcNGPepSrfxfdhUJ2LfdSAczwt4RTfN6BEf5QjqrICSpq3cwiH3AvYFEkkjS0H3BIRj
         IXlDeqKPIVb0pLUokd9DAvVQFqvd3u0GKgRdeWq6I5d+vIoTqBhcZspeuhKn48MmeMi0
         wl3siWf7oYw8SZjWrvY/FPexVyT+6Uy9cWW+ganTW4QZ+kTeSDMYIcKysgKsSboOO7Xt
         8QM3ccb0lWR/BbjKw/lEoqdzYZ6vCTshXCsFjdUzH+eT6L3ihNHmFRc7qOX8WVThaiGf
         oq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iSeeVmtABzNowDf5F46SaBMcGmw9fYRuGG/Tat8lx/M=;
        b=M11BRZ01gX4Ty/h2kS4vXDLbZtKXsCJEYvcMbFi/VstqN8wSbaXkwPhrOBdSUqYTR8
         arJVaNJm5G+UuDiymvzOBQHMYkkGFzVz6tiX7ucA2gXeUiPJJ7NPG1SX0hA/9mhRubaF
         witaC+DZNeZJ4yTrWaSnInV1rLQz/1ZHgZeTnmtTxLxlu29GGYpbfYxiSW9KcT8DnskF
         Dz8gGJcS0vpLk+91aH1tDwUhWVtV0ayoyvqgsxks4gAs85AGdw2XTz8CHRGPzE7IIVVK
         6kkmW+sHPeMEdKLywScH8sI2V5Jo6sGZinmjXx3a5i39ZR/dUtpeOk574yqq7aLEBvlF
         7xHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327G6XetdfzggT6JEjPfZGS3UzhdyJedwJxuMWFsJgq70NovtYQ
	/nQeU7bmWLbeQbZqQG0uA2c=
X-Google-Smtp-Source: ABdhPJy789L+f813x6a1FdB3eJwhShMX84LxVRIn6vCNnDY+XQQEyLKVA/ToDWgoa7ABxLJNz6gdFg==
X-Received: by 2002:ac8:1c92:: with SMTP id f18mr2096355qtl.234.1614256535519;
        Thu, 25 Feb 2021 04:35:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:d53:: with SMTP id o19ls2169638qkl.3.gmail; Thu, 25
 Feb 2021 04:35:35 -0800 (PST)
X-Received: by 2002:ae9:e8cf:: with SMTP id a198mr1193684qkg.462.1614256534946;
        Thu, 25 Feb 2021 04:35:34 -0800 (PST)
Date: Thu, 25 Feb 2021 04:35:34 -0800 (PST)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <be230d1c-42c1-4a49-9a85-1d30c6fb613cn@googlegroups.com>
Subject: How to run freeRTOS for RaspBerry 4B in  cell ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2006_805024076.1614256534209"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_2006_805024076.1614256534209
Content-Type: multipart/alternative; 
	boundary="----=_Part_2007_970579691.1614256534209"

------=_Part_2007_970579691.1614256534209
Content-Type: text/plain; charset="UTF-8"


jailhouse has support RaspBerry 4B hardware. 

Are there some  pages about build and  run  freeRTOS   in cell ?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be230d1c-42c1-4a49-9a85-1d30c6fb613cn%40googlegroups.com.

------=_Part_2007_970579691.1614256534209
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div>jailhouse has support RaspBerry 4B hardware.&nbsp;</div><div><br><=
/div><div>Are there some&nbsp; pages about build and&nbsp; run&nbsp; freeRT=
OS&nbsp; &nbsp;in cell ?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/be230d1c-42c1-4a49-9a85-1d30c6fb613cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/be230d1c-42c1-4a49-9a85-1d30c6fb613cn%40googlegroups.co=
m</a>.<br />

------=_Part_2007_970579691.1614256534209--

------=_Part_2006_805024076.1614256534209--
