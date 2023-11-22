Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBOG76WVAMGQE6FQDZDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA47F3C22
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 04:04:25 +0100 (CET)
Received: by mail-qk1-x73a.google.com with SMTP id af79cd13be357-77d5ea55ca1sf117118685a.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 19:04:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700622264; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q3B/M2248KRQ6tPqSO4RHztI7u/qpxsvST6gxLr0ZE9kaVuMMYI2murEdZFkF0PjxK
         KgL3ZSlIefgNI6Ava74BcYg9chfD+SEe8QUDJbYbscZ+iUkSs4odMlOnd+bt6VVHBvHp
         OXuBwa2CtBnjb9npI2ow8s4VXBN+Y3CdGwfF+t8tdEW6gCYxcoL/fNgaLGkdnWuO0dDJ
         OcJVIsoRTxC8KBxLt4cTh7yZF6fLF93IyxWQx+wwoQq+Bq95jv+n1qJQB7LEQz8W5qtD
         WCV0hRkGl74BY4K7dMKdU0Mpxg6/5rDtcN5Pb7zffaSufMwmp6LIW9DwkkK4TBM9bnSZ
         bmUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=IkUtw7l35c9pAVPYH0zlnTfnONwZ9l06B1KdLfJTPjk=;
        fh=bwSLe+MrnuZTdwNEWNot/rSfzPW7Hw6F8bWGLxulN8s=;
        b=Rx4M4+91PNaj5oSeZZSK9iP3kMuHiFgNd5YUzIgqDilScFqnHEArOtOdJAXdXwirke
         AiayegkQXNak2+APIjp13NnTK48sCCYi33/S1wABt/MTAXDQr3z5FwVCkVyNLAi1h+ew
         gso60PObEHYH2mE0mrbNHXR509SVXTkN7g9IcDjaqpHrvrxd4S5kCjrB/YGWbxQQhu5P
         CFM2t0LOD8qLxTkh7eMaFfto32Dx5nqsBHMFuL46p8C9nDdqQr5cnNyQkdj8YelmzKU/
         /1xoPzIH7EUpXQQbVRUkQ8/YpQc1gvLuwLxvKoabYZKF2KDhM/mVtk0c18+tJ5emREB6
         i3MQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=V6vNoeuK;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f36 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700622264; x=1701227064; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkUtw7l35c9pAVPYH0zlnTfnONwZ9l06B1KdLfJTPjk=;
        b=IEW7gumzBvAm+9v3coTN+xf5wSlsOuc3vPHBb7KA2AdIPO34dyOAwmWuPvvhEyFXIb
         QaeCbJr6Y4QE/Ej1aSl8GmUBNwrm8eAJvDx4z5rMi9NuqnlDNxCHQ8d0tKYa6JHfyi0/
         l6W42nSu+saXie34uXGUIgiUpw6AHVYt0KsTgLcr2ZeTJEvc4J9dOSmVkJX7QMnZe15W
         LwfiQP5cULBs9HeAsSIDodU2i87xQWaRWQdqbf+raO5t01KbIOxjyQ1p5t5jWt4vEIb6
         zL/eVvjs4EJhHkkx78/540KKrS4OMJg7i5p/elX0VZ01eFUyuv5D9+wN+ZCQ+23As4T4
         vWZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700622264; x=1701227064; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IkUtw7l35c9pAVPYH0zlnTfnONwZ9l06B1KdLfJTPjk=;
        b=XXwihIIwvgXSsNkQY0WlbLE+1xvILnxKcgHyFoa2VABvVDIqSBnd98h8vlR83nkdXB
         CfACXCbLpBM8tzR4kpQIalaCMM7Odq67ZzVkH2dGsS7qEKW4IFStdOsJ2EykES98OyLQ
         8j7n6DOj9NBz/zQ9eb4gRi0Ed7aEmiBUDTtodQUB/ARyU+1VqF8vyAXw94ZxKr9StBN/
         wzbpTjSqWzwrl4It4Y4dtIiy4iQo/Ts2kG69vFOsmtGBBPBvQ4ZSwE7/BTRbKMS/DFU0
         44J67BNhb+h7pzU9VKb1q3P3q2az2DuJ5bSDvimUvQHGIwcEl1NoQbt0zT/A34Wq9BWw
         Wqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622264; x=1701227064;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkUtw7l35c9pAVPYH0zlnTfnONwZ9l06B1KdLfJTPjk=;
        b=LdYyc/FXrVnX1TiVa/xyBpOuRn2rPv3SlcLL4E6VzUrOw4l3VappH5GKIlz7RCkkWM
         tJAlaoOTNSMxZe9y1jv3L1ne2gl5At2/3b6eHK8YP6cW8ywkMttzRlq8+Omk5NB2PapV
         CFAEGv/2OyXq/ZrMhHRJzNiXa+p5iOSoiFw+jXmPbKhz2+LnUVRuP1uJKjE8P/n4MsLm
         GRy3/nlmmuqclSb4BWH2yVN+je3ZyKUdPWnIJOR8C2ngBi34kAZhC7bUnMEYIFoEwcFs
         MHDM0DAYQsZ/xQBDvET0nsToseUWD16WQ1ccoR7YyXOMzpDgt+xLsBIcq2r3S2WhKPSz
         YbKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzGkoUgxpvXQrMycwtvgWJkxe+tGX1Z6Wfyqz1U1gW7/zUd1aeD
	SuwCRWMNN/u5H80fQ97EWu4=
X-Google-Smtp-Source: AGHT+IEHPLByV06G3rFP1thOBJyld9w2EKxA68HwbLiSpfkThwrQQotxuYeLaezxPVIRs4A5ilIMzg==
X-Received: by 2002:ac8:7f0f:0:b0:41e:2d8e:b364 with SMTP id f15-20020ac87f0f000000b0041e2d8eb364mr1384448qtk.53.1700622264430;
        Tue, 21 Nov 2023 19:04:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:4c1a:b0:423:7c51:c72d with SMTP id
 ey26-20020a05622a4c1a00b004237c51c72dls228690qtb.0.-pod-prod-02-us; Tue, 21
 Nov 2023 19:04:23 -0800 (PST)
X-Received: by 2002:ac8:7e8c:0:b0:423:7172:4754 with SMTP id w12-20020ac87e8c000000b0042371724754mr1496930qtj.15.1700622263143;
        Tue, 21 Nov 2023 19:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700622263; cv=none;
        d=google.com; s=arc-20160816;
        b=WhmycyUFDn2aMKXf5nKD71n/EWEwaZkptLlAA+LFt3oQCyBrfBCVrD4kHtJzXKJKN3
         kvaCoqtEwdcWQQfNKLMhERs6qbTumdDhR38ikhV5r72g7zrT/izQeriwrPLxlnHecLxQ
         7JbYoLh39XsBUXAkhov7+65Ntfbg5TNHF0Tacd+RKUfaB9vnZHOL1X0lARMYRBXwx6oq
         3zWxIBpCJZ4xFPA5JW0+Dg9RXSuNvCADUePm1/GproZwtVBS0YM0cx/iTmk1gz2cX3LE
         p2Y0c9D7cwSt/jkPoaUumXmMzyPXZ3dHXEFVKA15ot/xtNE6sIRMWfBVaqZp0oMP8/Wy
         DzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=goga53CwSsBVNPga/855IhIrMmH9LulQVMauja4yq/U=;
        fh=bwSLe+MrnuZTdwNEWNot/rSfzPW7Hw6F8bWGLxulN8s=;
        b=Shev2jtkOsU4vjo58lNQ+NG1fL/u2YKoqHjCC2X0QY5ofBI0GfuzQeP4a7HRCKCWRW
         WiPx5LJVsTACLupGX7pGKvCwmd/47o1VGoeZ32UnH5ubdZYtOYd/bJyflO04AtAh90Sn
         F7Vsgfo7ujAgHCFq4roybCvkg+3Ta5tihFpJ4tAfhbo/Nrzqc04M4eMMNNxP6l15QDpr
         JXdb6Mu7eqHJsw0Jc/8Irk7rmQ/qcjwMElUVK29kwohz/E0CTsbwVDv5WeG+di4I4Am0
         5ofZlkGkvo66r59osO9QbLIbl5cMMicoQ42repgLLSwTbAskNZCO92aFxJB1tXLdr0uT
         tjig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=V6vNoeuK;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f36 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com. [2607:f8b0:4864:20::f36])
        by gmr-mx.google.com with ESMTPS id bl8-20020a05622a244800b00417048548c7si1775387qtb.2.2023.11.21.19.04.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 19:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f36 as permitted sender) client-ip=2607:f8b0:4864:20::f36;
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-679e7d2d7c4so11093956d6.0
        for <jailhouse-dev@googlegroups.com>; Tue, 21 Nov 2023 19:04:23 -0800 (PST)
X-Received: by 2002:a05:6214:1bc6:b0:677:9348:ecaf with SMTP id
 m6-20020a0562141bc600b006779348ecafmr1035394qvc.45.1700622262791; Tue, 21 Nov
 2023 19:04:22 -0800 (PST)
MIME-Version: 1.0
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
In-Reply-To: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Wed, 22 Nov 2023 11:04:11 +0800
Message-ID: <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_arm_cortex_A55_support=EF=BC=9F?=
To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000def2d7060ab4f9bc"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=V6vNoeuK;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f36
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000def2d7060ab4f9bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is no difference to run jailhouse on A55 cores.

'=E5=BC=A0=E5=B9=B3' via Jailhouse <jailhouse-dev@googlegroups.com> =E4=BA=
=8E2023=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 13:47=E5=86=99=E9=
=81=93=EF=BC=9A

>
> Hi All
>
> I would like to know, are there any examples that are adapted to arm
> cortex A55?
> Or are there any SOCs that are arm cortex A55 and have successfully
> transplanted the jailhouse program?
>
> I saw that A57 and A53 products have suppressed jailhouse applications,
> but I didn=E2=80=99t see A55?
>
> Cheers,
> Zhang
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-e=
f67bb1bf4b3n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-=
ef67bb1bf4b3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-9ruixKv7sB%3DEFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg%40mail.=
gmail.com.

--000000000000def2d7060ab4f9bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is no difference to run jailhouse on A55 cores.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">&#39;=
=E5=BC=A0=E5=B9=B3&#39; via Jailhouse &lt;<a href=3D"mailto:jailhouse-dev@g=
ooglegroups.com">jailhouse-dev@googlegroups.com</a>&gt; =E4=BA=8E2023=E5=B9=
=B411=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 13:47=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>Hi All<b=
r><br>I would like to know, are there any examples that are adapted to arm =
cortex A55?<br>Or are there any SOCs that are arm cortex A55 and have succe=
ssfully transplanted the jailhouse program?<br><br>I saw that A57 and A53 p=
roducts have suppressed jailhouse applications, but I didn=E2=80=99t see A5=
5?<br><br>Cheers,<br>Zhang<br>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf=
4b3n%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-9ruixKv7sB%3DEFhnH6Uw4GsYgDnpKjtCqBrRGtkbtx=
uSg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAEfxd-9ruixKv7sB%3DEFhnH6Uw4GsYgDnpKjtCq=
BrRGtkbtxuSg%40mail.gmail.com</a>.<br />

--000000000000def2d7060ab4f9bc--
