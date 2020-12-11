Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBXWJZP7AKGQEDO6ETSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF82D6E67
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Dec 2020 04:17:52 +0100 (CET)
Received: by mail-qk1-x73d.google.com with SMTP id 198sf5490929qkj.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 19:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iptZShjpzOox1LtLCxzc59zqxLBWq8nyZUvekWhjlWg=;
        b=RioCuySndX90KoyQ+4fWzQXF8t0UEPNPnZUvAE9K6KBKUxeUVagC6X0GxmbRmpA3hu
         dSi2A9a4Vk8ksNQKFx+rX7m+LWwroX/+pYd7hl+uSfwRftpzmQ0b6Q+gtghcfvRu9IsH
         snqPy0PpfDMY3/MR+fVuwo3uuKgYPZRVCF835/GpzAMZ3kJ5RS6SnsnhreosbhY0fvpG
         k8vL7hpJJPGFfYZHbje70m2Q6TpsrkM6mJFFwUdfU0wirvZ9JlmeKH0so56JTcKRNOAY
         ljHMvdmy25hx5fT0U5BK8qBCaeKq+xQamFY+XfeSmTkiWNQD0vMB+RfJgvNyxsbxdCuv
         JNdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iptZShjpzOox1LtLCxzc59zqxLBWq8nyZUvekWhjlWg=;
        b=unydhDj5dTc72NnzufTqkB5vtnT9+yLwl91dTAQfZNOoX6IO9gpXHH99ZyHFyLLMvF
         3xbqz+XTQS3MR7GRS/jXdp0woYv+jd0wUwX7vkY782ttR3FseXgkHMutDK8g4Poxsib1
         Qzi9VKK0Ql8qVkBBQw7mNjIb1jwF2D0F68TPMsW1jjFt3LBzXBylLaOpq/rJ80dJUSnx
         poklGag9P+GKuQlw+oIjthdaat57Sma6TG1kEB3i5v7YjfkjB7qJ4HNmwj86Gz9W4A35
         q7eXAe5PUcnm51YjAHFcfFB6hAdwj3Bm/qQKJiYizc10X62vQt7BMTNBggUBCBgMFbYh
         lsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iptZShjpzOox1LtLCxzc59zqxLBWq8nyZUvekWhjlWg=;
        b=tQcuSqug5AqMgyCGnJ9YMFa8DjXSzSorxheSes7SO0f9K0D3x/afDRhhBT+piCnFjg
         7LQriCwB9nxl2PAZIqVLtJocppDyfs5AAbSFE5mQOHh8BcFr3iE6oI3Q1+LBjiwwOwtN
         sppnDpHoVfa/uH8PBQJ/Xm89iUYFEul8a7JvB1I5D+X0Pl7mvcmaBjaUtbmS9Kq3n0vf
         JKmyGo6aUOm45dOoJmdhrI7wkEk175Vm0UAvANnPFos9ZVQCVDu6mfT/Q/YXCR/LN23i
         Wo13oc857vn2i5Ix+o5B9+fZlln07k55IUIRpu3+Di9Qv0sW5n3p/TjwGV+xsSiI8Cn1
         +bFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532oaXfVsBmLymQbjmyGgr4WEz6o3eOZsM3M1XrAYXT9tT9y5M/k
	AozqyWiQ3pKtt1gWL9nxlqQ=
X-Google-Smtp-Source: ABdhPJxiEAESun+3MVakZh9xziIT5pyOJXDsIu1FP5VozIqp/ZhdxAZeTTXKNnl/suMpk/KjUNy9Zw==
X-Received: by 2002:a37:b342:: with SMTP id c63mr13200059qkf.146.1607656670845;
        Thu, 10 Dec 2020 19:17:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:36ea:: with SMTP id f97ls2719578qtb.4.gmail; Thu, 10 Dec
 2020 19:17:50 -0800 (PST)
X-Received: by 2002:ac8:70c1:: with SMTP id g1mr12780498qtp.108.1607656670194;
        Thu, 10 Dec 2020 19:17:50 -0800 (PST)
Date: Thu, 10 Dec 2020 19:17:49 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c33c208b-b94f-4764-9a35-722c0b43e483n@googlegroups.com>
In-Reply-To: <20201210105128.25554-1-hongbo.wang@nxp.com>
References: <20201210105128.25554-1-hongbo.wang@nxp.com>
Subject: Re: [PATCH v1 0/2] Add configure files and dts for NXP ls1043a RDB
 platform
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_412_848867991.1607656669045"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_412_848867991.1607656669045
Content-Type: multipart/alternative; 
	boundary="----=_Part_413_1992450927.1607656669046"

------=_Part_413_1992450927.1607656669046
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hongbo,

Now ls1043a silicon v2.0 supports 64K alignment GIC address,  we need to=20
support silicon v2.0 but not v1.0 in opensource community, please update=20
the patches.

Jiafei.

=E5=9C=A82020=E5=B9=B412=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 =E4=B8=8B=E5=8D=886:48:42<hongb...@nxp.com> =E5=86=99=E9=81=93=EF=BC=9A

> From: "hongbo.wang" <hongb...@nxp.com>
>
> hongbo.wang (2):
> configs: ls1043a-rdb: add cell configure files
> configs: ls1043a-rdb: Add linux inmate dts demo
>
> configs/arm64/dts/inmate-ls1043a-rdb.dts | 176 ++++++++
> configs/arm64/ls1043a-rdb-inmate-demo.c | 137 +++++++
> configs/arm64/ls1043a-rdb-linux-demo.c | 165 ++++++++
> configs/arm64/ls1043a-rdb.c | 498 +++++++++++++++++++++++
> 4 files changed, 976 insertions(+)
> create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts
> create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
> create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
> create mode 100644 configs/arm64/ls1043a-rdb.c
>
> --=20
> 2.17.1
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c33c208b-b94f-4764-9a35-722c0b43e483n%40googlegroups.com.

------=_Part_413_1992450927.1607656669046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hongbo,<div><br></div><div>Now ls1043a silicon v2.0 supports 64K alignm=
ent GIC address,&nbsp; we need to support silicon v2.0 but not v1.0 in open=
source community, please update the patches.</div><div><br></div><div>Jiafe=
i.<br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail=
_attr">=E5=9C=A82020=E5=B9=B412=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=
=9B UTC+8 =E4=B8=8B=E5=8D=886:48:42&lt;hongb...@nxp.com> =E5=86=99=E9=81=93=
=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 =
0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Fro=
m: &quot;hongbo.wang&quot; &lt;<a href data-email-masked rel=3D"nofollow">h=
ongb...@nxp.com</a>&gt;
<br>
<br>hongbo.wang (2):
<br>  configs: ls1043a-rdb: add cell configure files
<br>  configs: ls1043a-rdb: Add linux inmate dts demo
<br>
<br> configs/arm64/dts/inmate-ls1043a-rdb.dts | 176 ++++++++
<br> configs/arm64/ls1043a-rdb-inmate-demo.c  | 137 +++++++
<br> configs/arm64/ls1043a-rdb-linux-demo.c   | 165 ++++++++
<br> configs/arm64/ls1043a-rdb.c              | 498 +++++++++++++++++++++++
<br> 4 files changed, 976 insertions(+)
<br> create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts
<br> create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
<br> create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
<br> create mode 100644 configs/arm64/ls1043a-rdb.c
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
om/d/msgid/jailhouse-dev/c33c208b-b94f-4764-9a35-722c0b43e483n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c33c208b-b94f-4764-9a35-722c0b43e483n%40googlegroups.co=
m</a>.<br />

------=_Part_413_1992450927.1607656669046--

------=_Part_412_848867991.1607656669045--
