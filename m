Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBRMY72QQMGQEXX562KY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id D32316E7366
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Apr 2023 08:37:58 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id 5614622812f47-38e2e292493sf1029313b6e.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Apr 2023 23:37:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1681886277; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zehviga4vE6J7o4fTfH78KFszylVui25FZNSjlJXakoOWWtNJSTZZ27D7ysBlEXBQ0
         aFJHoCHHcFS5K1S9DPh31kkDBToeSXMPamU3fjpi18xjYwZeF37UmukQMGxE0PjCmLmy
         Re/Th4uWl3tkMUcC2GA0ev6ZoSEH7d562JvM38j0IYqvQ62lX0pRgIZA37dpOf09MKJx
         NtiBUVEckRlMJ6/5eN49jkR3qqaAjluGalg2dwQrCeuIkbvdWJelzBWFlFB8qOQtI6bp
         qLkm/WDfknVK8aSsQzp9MN89TNDh0hym+tS+XwvcmzGIg0ZaaJL6lbGRw0X/oghd/H3/
         lvpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=uk1IkXhRj6cU+WJ1GUiz4UWEakgHbgPY+3CIlpYBhOc=;
        b=fZOz+O3J/yUxJY1mWxytufaVbopIePn4zKCRotefuuh6+Ht+PSsDJ5qjM2Raqkt9Zn
         Huzj28phOlyGxkyPMtDmk6qG+OrbA7Af80cCuY3GwMomxZsovuG7shU1K1Vndqe5lfuX
         oYZ/vq26rVJHQV0iO3SrqEJNqgFCNDuK1tZX2sxc4qmDjVaRSPQnrm7T3Z352GtTnSBO
         9fw0MP2U4LyjPfPXmFjk2wVfO8xN1DymhBe/e+Zf/Lgbb4k9EJ/xCXbnFsiVdWIMSwUU
         SfQneoyiwMQJ8xZTwcbyLG0TSoarWZ9tW7j0n0zfnpN3HNS14z3HGUMtgb2zAe/GB71U
         XWaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=BZJSLikd;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f32 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1681886277; x=1684478277;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk1IkXhRj6cU+WJ1GUiz4UWEakgHbgPY+3CIlpYBhOc=;
        b=XUouXRuKHEEpLH9IuTxMl+WgxM68mwvxV0fAgP3XdWqPtY8XQ+ME55h1Ct5q+CvupC
         vfVBDeQwuNBmySFuOTjoRdSFMcDZuz3dUYcy8jqVYhtcEn0IdSHPhuOAAM+QjWNHb/wN
         L5ayepWENhEA2CU10RdRrFoHHNnuBZedQ/T1Jz9G/xwXtO9thNrIUowLpXKAkAugB8nw
         KPWaC51jgyLbBYKDHI9jyW4Zg5/YMXJjiRwJYetYY1xCm4nqyBLLSak51eSkS/0CAMf5
         3cIbc5LM7K1zdWxvKIxwCWWLijRzThBzrcsues7kQPrgvZDkeyVcPIR83y4vhT0U0ZKU
         uM8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681886277; x=1684478277;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uk1IkXhRj6cU+WJ1GUiz4UWEakgHbgPY+3CIlpYBhOc=;
        b=nkp2lXXqX/XLbloWSOQDuRQyqbiXQi9O1v3spEVg5JOoplg+N60NSrzCZoXsanyQ7J
         YzNT6nNG5liRyqPDkcytb8raaWR0VmQLM/ZuiA33aRn6ypZ1x3cIq2Rk1VgEDLFv4S2s
         IYrMhvXQdz3lCuO7Hi30YRXz12rxqxfzGz6cf+iTUNRDICSwFwQQScWqZ8FN0vmucMwB
         6bZ/1n2XwliuYU4XapknB0dhx9SgcUOTUdZoLMCaUHqfSDrh8BhYptw8fgGvljSf2Q3E
         HkDQ+CRwGxOrKi/KHGCSrj/tQDo9iMdzy+oncEFjd0yrIF7YVVC2syacUGEKNJxTvVxG
         K2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681886277; x=1684478277;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1IkXhRj6cU+WJ1GUiz4UWEakgHbgPY+3CIlpYBhOc=;
        b=Yiy/stZoS1YA8X9RBQp4qnEJU5YFTih6MJ1GCuqEPv3vv70UEsMMJ1aFia5MLyg4Ns
         GkHXTU+tvhEyCHMsnvuZxwaAMnZzodGIrPscZpa21Z6CEEQ6/4NNYm2vCQH+OG/POpho
         TLdSOMjFbUY2lbTHbMDufl4mDmCZ9Nu9Brkrzk1h9k1RzzfIOw3gQ6FYQJMHZqod0Fh7
         hN9sHNwyX/hA1eB29chRLiyhOE3e3K0y1hpdtckRRkXB4aYsEsnWeToj7fU6ydlWql0h
         WfUmwgt5wLMGCTlpvPnrroYtgTDcR+EYSr6AOcBuTuooNyfXx384hPVVRSNjukiajHYU
         rxqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9djAQOxiFm6offUE9j0Z5ZPdM+bxpG9ptKEwKuLEsvNYYsbir2x
	6RkjDqstSYdlN0yQiOFKbcQ=
X-Google-Smtp-Source: AKy350Z7E+vG6F697idsiIASvIwmd/tkl4H+XIcbrTQdc54X8wV4pBkhjAhnVQ6Fu/oyhpSNXE3mVQ==
X-Received: by 2002:aca:ba41:0:b0:38d:ee6e:236a with SMTP id k62-20020acaba41000000b0038dee6e236amr1334633oif.7.1681886277452;
        Tue, 18 Apr 2023 23:37:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:660a:b0:176:30d5:30b9 with SMTP id
 gf10-20020a056870660a00b0017630d530b9ls3583522oab.9.-pod-prod-gmail; Tue, 18
 Apr 2023 23:37:56 -0700 (PDT)
X-Received: by 2002:a05:6871:84:b0:177:81bb:1b1b with SMTP id u4-20020a056871008400b0017781bb1b1bmr2698762oaa.40.1681886276583;
        Tue, 18 Apr 2023 23:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681886276; cv=none;
        d=google.com; s=arc-20160816;
        b=Obn5fVGXqArYO0M8gXz9gxPyUDvADNXXycbRY3PMeKpbFO4w/t9qpx/Cg7d57BwpP8
         7AdphVUc1rObxIeswjESqY4ITqtRvdhL/eXZbMLtBQ1AX03GNe3kAWZ+nNWZCsfgypCW
         sPI6tZmb7QXdffnoNnWnnu/jcycOU2iBVPCA7dlamREWQWQKi/RRgm4Uki2NyT83Srkg
         8hVKmQm5tPtYvzJeqtV2LBfVXhq/InkX19PFxK83yPY80Z/kJd2VL3JmgTpYqyX3XaiH
         w9mBUTLnB8j+cxHhDSXXpVtecIFeI7/vrK/tSoxaNZjMqlqUkbt/wBk3Z5xV9WA7f0pd
         VA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4ouTDtDYeQwLw/xa6B98TrUqGlqj35tZAMtzRVkQ4jk=;
        b=eCotUOZod4/0LxWI55z7xz3VtOcJDhqkJCEV3+OAUxXuMLLu/RVwNqNNQo2rZDuf6F
         0H92Qjq+WWvX3iVyR41L7rTOmyfH5qTokxg9jDkbSeC1dLuMgI4p8yyrUrVWHOl/V62G
         cB+Du22AUASBGxejFzhuDvj1ucwLA3uNA+HjCq3OPqlReOpRASLa+HbE4tKO4H0wsjoI
         U+CTE/IU+wCHs5/ZVqhbF2Krwl1sWHN0iTjjVfu68Oc5R2ll7/CknI4mBV552ihnmMU3
         vwtVnQw38FVquAU2EgqEryIo/AD72H19vnjpZTtyWBtLg2bwg+neCXcFztyL+S5YdqUv
         A1kQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=BZJSLikd;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f32 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com. [2607:f8b0:4864:20::f32])
        by gmr-mx.google.com with ESMTPS id gz8-20020a056870280800b001840f14094asi1088279oab.2.2023.04.18.23.37.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 23:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f32 as permitted sender) client-ip=2607:f8b0:4864:20::f32;
Received: by mail-qv1-xf32.google.com with SMTP id a15so9229287qvn.2
        for <jailhouse-dev@googlegroups.com>; Tue, 18 Apr 2023 23:37:56 -0700 (PDT)
X-Received: by 2002:a05:6214:c66:b0:5ef:5138:1e5d with SMTP id
 t6-20020a0562140c6600b005ef51381e5dmr24506942qvj.49.1681886276108; Tue, 18
 Apr 2023 23:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n@googlegroups.com>
In-Reply-To: <596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Wed, 19 Apr 2023 14:37:45 +0800
Message-ID: <CAEfxd--FGSJMkPhD1fds11Gh_DBMQGZiabAyVQ1QYEqcs112mg@mail.gmail.com>
Subject: Re: gic-v3 inject pending interrupt.
To: Johan Carlsson <johan.carlsson89@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000000a467805f9aaaa61"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=BZJSLikd;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f32
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

--0000000000000a467805f9aaaa61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks correct to me. I suspected SGI got lost when I develop root cell
suspend/resume. And your changes indeed address the issue.

Johan Carlsson <johan.carlsson89@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=
=8831=E6=97=A5=E5=91=A8=E4=BA=94 20:25=E5=86=99=E9=81=93=EF=BC=9A

> Hi, I'm sending SGI interrupts between cores with a gic-v3 and noticed
> that it sometimes the interrupts were lost. After some tinkering I realis=
ed
> that gicv3_inject_irq skips the interrupt if it is already in a the list.
> I'm not sure this is correct but I expect that the if it is already in th=
e
> list but marked as active the pending bit should be set and return.
>
> With the following change no SGI interrupt where dropped.
>
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -566,8 +566,16 @@ static int gicv3_inject_irq(u16 irq_id, u16 sender)
>                  * A strict phys->virt id mapping is used for SPIs, so
> this test
>                  * should be sufficient.
>                  */
> -               if ((u32)lr =3D=3D irq_id)
> +               if ((u32)lr =3D=3D irq_id) {
> +                       /* if interrupt is active set pending bit. */
> +                       if ((lr & ICH_LR_PENDACTIVE) =3D=3D ICH_LR_ACTIVE=
) {
> +                               lr |=3D ICH_LR_GROUP_BIT;
> +                               lr |=3D ICH_LR_PENDING;
> +                               gicv3_write_lr(n, lr);
> +                               return 0;
> +                       }
>                         return -EEXIST;
> +               }
>         }
>
> Feel free to add my: Tested-by: Peng Fan <peng.fan@nxp.com> if you do a
formal patch.

> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-8=
d1dfbfd8007n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-=
8d1dfbfd8007n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd--FGSJMkPhD1fds11Gh_DBMQGZiabAyVQ1QYEqcs112mg%40mail.gm=
ail.com.

--0000000000000a467805f9aaaa61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This looks correct to me. I suspected SGI got lost wh=
en I develop root cell suspend/resume. And your changes indeed address the =
issue.</div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Johan Carlsson &lt;<a href=3D"mailto:johan.carlsson89@gmai=
l.com">johan.carlsson89@gmail.com</a>&gt; =E4=BA=8E2023=E5=B9=B43=E6=9C=883=
1=E6=97=A5=E5=91=A8=E4=BA=94 20:25=E5=86=99=E9=81=93=EF=BC=9A<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hi, I&#39;m sending SGI inter=
rupts between cores with a gic-v3 and noticed that it sometimes the interru=
pts were lost. After some tinkering I realised that gicv3_inject_irq skips =
the interrupt if it is already in a the list. I&#39;m not sure this is corr=
ect but I expect that the if it is already in the list but marked as active=
 the pending bit should be set and return.<div><br></div><div>With the foll=
owing change no SGI interrupt where dropped.</div><div><br></div><div>--- a=
/hypervisor/arch/arm-common/gic-v3.c<br></div><div>+++ b/hypervisor/arch/ar=
m-common/gic-v3.c<br>@@ -566,8 +566,16 @@ static int gicv3_inject_irq(u16 i=
rq_id, u16 sender)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* A strict phys-&gt;virt id mapping is used for SPIs, so this tes=
t<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* should=
 be sufficient.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((u32)lr =
=3D=3D irq_id)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((u=
32)lr =3D=3D irq_id) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if interrupt is active set pending bit. =
*/<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ((lr &amp; ICH_LR_PENDACTIVE) =3D=3D ICH_LR_ACTIVE) {<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lr |=3D ICH_LR_GROUP_BIT;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 lr |=3D ICH_LR_PENDING;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gicv3_write_lr(n, lr);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0=
;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return -EEXIST;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div><br></div=
></blockquote><div>Feel free to add my: Tested-by: Peng Fan &lt;<a href=3D"=
mailto:peng.fan@nxp.com">peng.fan@nxp.com</a>&gt; if you do a formal patch.=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-8d1dfbfd8=
007n%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd--FGSJMkPhD1fds11Gh_DBMQGZiabAyVQ1QYEqcs112m=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAEfxd--FGSJMkPhD1fds11Gh_DBMQGZiabAyVQ1QYE=
qcs112mg%40mail.gmail.com</a>.<br />

--0000000000000a467805f9aaaa61--
