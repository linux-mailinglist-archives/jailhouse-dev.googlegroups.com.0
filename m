Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBYUL4XYQKGQETAKMHQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263D1518B9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 11:22:28 +0100 (CET)
Received: by mail-oi1-x23a.google.com with SMTP id l19sf7427342oil.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=33kxuT4Lxm52WHMgLrM4wrzXnZOevTWqoqrDF/G5gk8=;
        b=rKboRSLhaaPeo5WX6XwNhgx0dsuZmZOE7z7xOeMSoxInJAfxTq3J1BBmtf5dycRWCA
         1+pHoFd4VL8VDJNw5VQknR15dPjvRFK7twsw4hBvKf5kjSNE/2JaAJvfbvYFQBPjd+7D
         s0MvPxix3QXMhde4Y0RZZ9i9AEAcDcVrJ6rgXrYLu8CrJLh0ncJbU13AkNk6CpSVATBV
         tiW1urHIgBpLKT52fKw03BkMesMXAhR5KMW23UaNHAPTE69RGRAXm8Db/st9ZwGC/g8F
         PRLn9eGFNOKarr8Q2PRYSqR5JahOa/oj+DdV+vm/PtpG34WlEjIDvqNztwqij+GUAWUZ
         HQbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=33kxuT4Lxm52WHMgLrM4wrzXnZOevTWqoqrDF/G5gk8=;
        b=PJLC4j/srvwoml3BjmI4T9cQ9puswhy3Dnqo2vb0GeO3ClOrFeOgY7rQGNIg5uziia
         ehvZ877+SoLnCpjEImbMwi1mXgrYK1+SphWZH61TFAl8bx4F0HnwLtXVuhVX48nfNp8o
         srhTPYcvabW30hJnlCBRjcfxbVlE/VtiJMS9rfb36XWDzXk/SpBG2Z6WmlVNPDdLbPKZ
         9CXSn6U0xUzHb+LGfGpz4d0T7M9BCWgMPML3vZ/CVKeZ5Sn5DW5xHSbb7tBdmilmSdfh
         uNA6xKbiL1HRuUdYQ7OgOYjUU+JkpS0F87zYtR83GLdCXYoTiHL6PNwDmaL74U02pqnu
         sKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=33kxuT4Lxm52WHMgLrM4wrzXnZOevTWqoqrDF/G5gk8=;
        b=PPhbsrmquLFbqXMMoMGWYZ6wB8o3f7shpAdNWNIlrsm8YVH8sXB2v8uBl6eg4knK+W
         FHvgpUFL+R679JXSoFArcTXE2o96VAP6r0sScy8Qt3MBSVFKbn7A1DZa/4VmcXJvIJ16
         i6XtA3K7kVMUXgoNnY+L8aKEOSgevwWsXCn2EGDDtvc/Bs5f79mgCGK6MUOkQ/Pol0GD
         MgRUttm7D77OUG43KteVf7Z82PRJWDat9tl5TSmOe1gGUAbwtiI4/qJQacFasHXtxnEm
         +jvXPvblc4ID0z1IHtbV0hrH3K2eopYlR9eiHaigyeRGDK0lUUVBBGPbjGAjtq5nvLA7
         eZyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJnHz3doANkHo0L/Vhxr+9cF0Fn+8gyQtXoTtt5khz6zFwxpYL
	8a3jZsMed12jXSafoIm98Bc=
X-Google-Smtp-Source: APXvYqzuKsV6p4uPPRrtuBaW9w/5fWu0ZlqgYY3rQK8ZTxiLTG4FEpkUpEOns9xcEr1K2lwYJcL9jg==
X-Received: by 2002:aca:90f:: with SMTP id 15mr2978908oij.18.1580811746909;
        Tue, 04 Feb 2020 02:22:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7dd6:: with SMTP id k22ls694563otn.5.gmail; Tue, 04 Feb
 2020 02:22:26 -0800 (PST)
X-Received: by 2002:a05:6830:12d5:: with SMTP id a21mr22079021otq.296.1580811746399;
        Tue, 04 Feb 2020 02:22:26 -0800 (PST)
Date: Tue, 4 Feb 2020 02:22:24 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <45fe22b0-4995-47af-bc3b-725627effb74@googlegroups.com>
In-Reply-To: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
Subject: Re: [PATCH v3 0/3] Add support for Pine64+ board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_350_1259747039.1580811745959"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
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

------=_Part_350_1259747039.1580811745959
Content-Type: multipart/alternative; 
	boundary="----=_Part_351_1263091382.1580811745959"

------=_Part_351_1263091382.1580811745959
Content-Type: text/plain; charset="UTF-8"

To add, please use mem=1792M. Not captured explicitly anywhere in this 
patch I guess..

I have a WIP setup for jailhouse-images. I would clean that up and send it 
across
some time over the weekend when I find some time.

Thanks,
Vijai Kumar K

On Tuesday, February 4, 2020 at 3:43:26 PM UTC+5:30, vijai kumar wrote:
>
> Hi Jan, 
>
> Sorry. It took sometime to send this v3. 
>
> As suggested, I have added the ivshmem-demo and linux-demo 
> as well. 
>
> Changes since v2: 
>
> - Added support for ivshmem-demo 
> - Added support for linux-demo 
> - Rebased on top of next 
>
> Thanks, 
> Vijai Kumar K 
>
>
> Vijai Kumar K (3): 
>   configs/arm64: Add support for pine64-plus board 
>   configs/arm64: Add inmate demo for pine64-plus board 
>   Add Linux demo for pine64-plus 
>
>  configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++ 
>  configs/arm64/pine64-plus-inmate-demo.c  | 131 ++++++++ 
>  configs/arm64/pine64-plus-linux-demo.c   | 149 +++++++++ 
>  configs/arm64/pine64-plus.c              | 376 +++++++++++++++++++++++ 
>  4 files changed, 770 insertions(+) 
>  create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts 
>  create mode 100644 configs/arm64/pine64-plus-inmate-demo.c 
>  create mode 100644 configs/arm64/pine64-plus-linux-demo.c 
>  create mode 100644 configs/arm64/pine64-plus.c 
>
> -- 
> 2.17.1 
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/45fe22b0-4995-47af-bc3b-725627effb74%40googlegroups.com.

------=_Part_351_1263091382.1580811745959
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To add, please use mem=3D1792M. Not captured explicit=
ly anywhere in this patch I guess..</div><div><br></div><div>I have a WIP s=
etup for jailhouse-images. I would clean that up and send it across</div><d=
iv>some time over the weekend when I find some time.<br></div><div><br></di=
v><div>Thanks,</div><div>Vijai Kumar K<br> </div><br>On Tuesday, February 4=
, 2020 at 3:43:26 PM UTC+5:30, vijai kumar wrote:<blockquote class=3D"gmail=
_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;p=
adding-left: 1ex;">Hi Jan,
<br>
<br>Sorry. It took sometime to send this v3.
<br>
<br>As suggested, I have added the ivshmem-demo and linux-demo
<br>as well.
<br>
<br>Changes since v2:
<br>
<br>- Added support for ivshmem-demo
<br>- Added support for linux-demo
<br>- Rebased on top of next
<br>
<br>Thanks,
<br>Vijai Kumar K
<br>
<br>
<br>Vijai Kumar K (3):
<br>=C2=A0 configs/arm64: Add support for pine64-plus board
<br>=C2=A0 configs/arm64: Add inmate demo for pine64-plus board
<br>=C2=A0 Add Linux demo for pine64-plus
<br>
<br>=C2=A0configs/arm64/dts/inmate-<wbr>pine64-plus.dts | 114 +++++++
<br>=C2=A0configs/arm64/pine64-plus-<wbr>inmate-demo.c =C2=A0| 131 ++++++++
<br>=C2=A0configs/arm64/pine64-plus-<wbr>linux-demo.c =C2=A0 | 149 ++++++++=
+
<br>=C2=A0configs/arm64/pine64-plus.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 376 +++++++++++++++++++++++
<br>=C2=A04 files changed, 770 insertions(+)
<br>=C2=A0create mode 100644 configs/arm64/dts/inmate-<wbr>pine64-plus.dts
<br>=C2=A0create mode 100644 configs/arm64/pine64-plus-<wbr>inmate-demo.c
<br>=C2=A0create mode 100644 configs/arm64/pine64-plus-<wbr>linux-demo.c
<br>=C2=A0create mode 100644 configs/arm64/pine64-plus.c
<br>
<br>--=20
<br>2.17.1
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/45fe22b0-4995-47af-bc3b-725627effb74%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/45fe22b0-4995-47af-bc3b-725627effb74%40googlegroups.com<=
/a>.<br />

------=_Part_351_1263091382.1580811745959--

------=_Part_350_1259747039.1580811745959--
