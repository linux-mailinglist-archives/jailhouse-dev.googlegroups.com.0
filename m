Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBB7VLVH6QKGQE7HOED6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1092AD1EA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 09:57:35 +0100 (CET)
Received: by mail-oo1-xc3e.google.com with SMTP id r13sf4505023ooi.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 00:57:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604998654; cv=pass;
        d=google.com; s=arc-20160816;
        b=kWI1eoVFPLndTjdaLpvNAaJPB8Zmh2pzp/k3EKQfY172lgV9WFuD4oS284bD3ICuqp
         5iQgpfYvy9pJROTRDDrCvyJFQPF5Gq19cnuY/JtB1Ss/IsfmnietkVLGhgAfdWuAjnrf
         J8Upn9zGkfMEar0PFqZx9i9tmoPxIo0O07AYofGg0FrZbxy7gDM78QLCzOd/oOCNuaQ3
         O+oBOX1VkYT9DrrV12J9270Okl/1CcRFCYu73IlUzIbNde8Dq9PNcxKitHF7du+IZM2G
         lmqwboJJOeMgBs/mndEOhCmOaVOIJUPrYNXQIT8jGKzSsuDGnWNN/Sf1muu0dxZWmDRO
         SIyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=UYWt6GLYWwIytuRfAtZc1Dw78AMR1Sg1fKh7wDAQMCs=;
        b=bMO0KCoX5LpC28RI5RKwLG9KZoQ+Ng21ONcfkWytKs8E+0CBiA9LryGBFlXofY1y00
         Pa5EFIO0htn0EapRR94iv7u0A9FV++2Ck4lYWuzjipyXtLsHtCtcqMZJdjeNI3XxcDFg
         yO4oULNDpvXPBgdYGm3C9SSV3SgwesAyWDo4MaSqeRnknh/o486/gDaw+ZP7Sy6Y2Je4
         J0JtGnbcYHYvGA0fLNXl5EP0bFDZcs2dVvmc3uIdjEimtT4JoRrfbfjdqnbetzbgDUBg
         9W5D+8WioOgOjVcoHbZn3xEXMGrf+Yi37HEenkJNSR470x04b4tGaocV9rLUimitDHJP
         PDIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OGmqJIeS;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::22b as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYWt6GLYWwIytuRfAtZc1Dw78AMR1Sg1fKh7wDAQMCs=;
        b=VcNeUkwcNK89osgTK9yl+tor1LhJJihMOBw1lBbsAOLBNXxFt31beYxjfT4gjy0RrY
         UGBziUQ2c20n0X5nd4xv2D33cQYMSF3Dt4sNEyamobnR620uNYZ3RD9SdNnTlZu5I7JB
         rysPd7rBkW8nlhLzZb/TbB0/dlfOZjYgwO0jVFIrvlhh+PmaAPNkIG4YkcVtieMjMtDZ
         ZYBcNN+N+9BJWLKZRuV/UnK/bsHg+jURl2vtAlmnQ+lEEdmdPLSYTP/PctkpIJ5ChkFO
         /b1trPCj0Y4heLNxlkO0+9J6wLRJhBKGIxYYWy6Yz/bi49TKVYhGN/cNoYdSpJFRR9IS
         j7Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYWt6GLYWwIytuRfAtZc1Dw78AMR1Sg1fKh7wDAQMCs=;
        b=lhY4EjluI7gXlDWMg+I5XCnfEqS9Ju+9p4kY5+C1c4CwIWxTspbr1AFdnF2BOpHk8g
         9G6c8ilGgoLtuZsTAcSjyNUSDhgVK472hDsGlTpbUesdnWldeka6MHzTWtMH6pXTed97
         aXYTghi9YVhY1i72Do1EIyNNejg4Rn4ZYYE5q7mjtbpl18R/yS7ShOVsttx08u+QJuMY
         Oqa4+1Hy+EZd250VRopDx53wWNVm0UHNiDaIdF9lZV0IU4Iy6op6luvxTsIv3jLKaz4w
         IUF3YMWYwHybrpPT1cuCsSR+iOVjrYgVW623ERcs5B+sam9k+r9lX4fFv3s45OdAS0GQ
         GVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UYWt6GLYWwIytuRfAtZc1Dw78AMR1Sg1fKh7wDAQMCs=;
        b=lnffIkMw/eNstUQhipvAnpdEPK5X8cnAEbWJkFeDg9BzrDq6Av5K5zs5RXuMYa/6ns
         aB7v9gMQVRlbrGLQ2GPY27CLIJT6G9XubFF8muCYObm5ou1dWZgA2ncu3wqgfzrM/Qs8
         I/MANXnBxDhKg/KPxeJ0BTWiQUaJ/YLj26IUOWz0o789IOkgtWoizhbGHx2lnK9AkBxG
         d3pqaYaoU1HegtioPpXX5y53bOib7HnTKY1R6UvidvWLm4Ixrju5yRk/zlFz+WGxfj3G
         UBFlmCxt8hpMlxG6S+kBH4WrLr/CRVWaHrUYuP5qAzuR3S6ZoelMnDGByVV0fIm5sVcu
         6mOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qRgRowspso9G1aF4tncoa9/k/1wWbwhltV5hxEjhr0Kqm9k04
	oIGaKtwVC74kexan3TKKaHs=
X-Google-Smtp-Source: ABdhPJxTpqCUm0n3ubcmZFBNb1+sAitKPpCnNNytZwNAlw3rjMznvNEr0D9HiKHg3eSKF4DV2rehYw==
X-Received: by 2002:a9d:4b09:: with SMTP id q9mr12566213otf.141.1604998654479;
        Tue, 10 Nov 2020 00:57:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cf15:: with SMTP id f21ls2859905oig.8.gmail; Tue, 10 Nov
 2020 00:57:34 -0800 (PST)
X-Received: by 2002:a54:4d8d:: with SMTP id y13mr2205071oix.75.1604998653976;
        Tue, 10 Nov 2020 00:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604998653; cv=none;
        d=google.com; s=arc-20160816;
        b=lOyLiIX6cj0xY8PLzaDTwU2f4G8TdidYRSVEWCE4rQohNv0zdoOKliLqWanKsANvNZ
         770uB8hFEE7HZJ79i3kenKce3CMSsaXLqarzghYqm9GxTVApf7qs8Zp5VCCb0G5slaJG
         w0QFjHkw9nUfES5hcWQcnkicGtkAf0qFlMyDA2AmzEiQsIdfyPmXjo3QwInNDjN2nkUR
         j+5c8h+4OWDZ226Ydn/P1Mt+Ydva7LQSgX2dHWYVTDnS+kEpzXDsUXtKekox3Kn3wrpu
         COKe88dTw716k/sa2uYAOzTCFiTZjiw1lvTTxQt93dSj4+vxebTOvRTyB+NpfgFN3C9p
         v/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8lovV6Lx91a8xM2InM/l1a8dVuZGkdeFrl01S1SfkQQ=;
        b=T8u7TRUs8NxqgpStC4EH5WKbRd1GxReJMjYYoqdR457pibicdee7Nz1/MimrXlllaO
         guGJ6k4FViwVf1AjgZ7VYGk+XZK3GoeiEXLfApKrf4SEXUSuSqiZdbOob92ISgSJx6Iy
         Vs/HU3P7+lnEO4zBVShlaMByczTlznIy//eDWP0HDFQnTTDA0Ufr32QWBOMy09PEIjEi
         MDQY2Ng38VMnZ1LgDpqalEh7sX0k4NDRBsJPJxF1l2AeZ38d4xSBsOuKetKDKikH2pDK
         83ZIsacOy9HCTEQLD9c3NEkzQv2okemawuN1jtNxVEgUADsWYQt4HY1PzERDL60bY2fv
         CT2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OGmqJIeS;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::22b as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com. [2607:f8b0:4864:20::22b])
        by gmr-mx.google.com with ESMTPS id d20si1049705oti.1.2020.11.10.00.57.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 00:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::22b as permitted sender) client-ip=2607:f8b0:4864:20::22b;
Received: by mail-oi1-x22b.google.com with SMTP id k26so13528569oiw.0
        for <jailhouse-dev@googlegroups.com>; Tue, 10 Nov 2020 00:57:33 -0800 (PST)
X-Received: by 2002:aca:c6ce:: with SMTP id w197mr2125945oif.98.1604998653545;
 Tue, 10 Nov 2020 00:57:33 -0800 (PST)
MIME-Version: 1.0
References: <01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@email.amazonses.com>
In-Reply-To: <01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000@email.amazonses.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Tue, 10 Nov 2020 16:57:22 +0800
Message-ID: <CAEfxd--AYp8fHSjECUbgF2pJ01Xme+0cjAVpXF+m+GDqHUYNXQ@mail.gmail.com>
Subject: Re: peng.fan has invited you to work with them in Slack
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000009c125805b3bcde42"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=OGmqJIeS;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::22b
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

--0000000000009c125805b3bcde42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure whether this works to let more people join the slack channel. I
created a free slack channel for online talk.

Thanks,
Peng.

'Slack' via Jailhouse <jailhouse-dev@googlegroups.com> =E4=BA=8E2020=E5=B9=
=B411=E6=9C=8810=E6=97=A5=E5=91=A8=E4=BA=8C
=E4=B8=8B=E5=8D=884:54=E5=86=99=E9=81=93=EF=BC=9A

> Join your team on Slack. *peng.fan* (peng.fan@nxp.com) has invited you to
> use Slack with them, in a workspace called *Jailhouse Hypervsior*.
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
>  =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =
=E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C  =E2=80=8C =E2=
=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=
=8C =E2=80=8C =E2=80=8C =E2=80=8C =E2=80=8C
> Join your team on Slack
>
> *peng.fan* (peng.fan@nxp.com) has invited you to use Slack with them, in
> a workspace called *Jailhouse Hypervsior*.
> Workspace name: Jailhouse Hypervsior
>
> J
> Jailhouse Hypervsiorjailhousehypervsior.slack.com
> Join Now
> <https://join.slack.com/t/jailhousehypervsior/invite/enQtMTUwMjIzMDk4NDIw=
OS1kMGVjZGM1MjU3NTExMjUzNTQ1ZGMxNmVlNzI3Mjg3MTIzZTRhMDc3NDgwODMzZmM2OGFmMjY=
xNThlMGJiMzZj?x=3Dx-p1495803348528-1478122999844-1486512921109>
> peng.fan has already joined[image: Profile picture of peng.fan.]
> What is Slack?
>
> Slack is a messaging app for teams, a place you can collaborate on
> projects and organize conversations =E2=80=94 so you can work together, n=
o matter
> where you are. Learn more about Slack
> <https://jailhousehypervsior.slack.com/x-p1495803348528-1478122999844-148=
6512921109/?utm_medium=3Demail&utm_source=3Dinvitation-to-join>
>   Made by Slack Technologies, Inc <https://slack.com>
> 500 Howard Street | San Francisco, CA 94105 | United States
>   Our Blog <https://slackhq.com>        Policies <https://slack.com/legal=
>
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/01000175b15d52f3-97f15e86=
-058a-4396-b74d-6634837c5c35-000000%40email.amazonses.com
> <https://groups.google.com/d/msgid/jailhouse-dev/01000175b15d52f3-97f15e8=
6-058a-4396-b74d-6634837c5c35-000000%40email.amazonses.com?utm_medium=3Dema=
il&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd--AYp8fHSjECUbgF2pJ01Xme%2B0cjAVpXF%2Bm%2BGDqHUYNXQ%40m=
ail.gmail.com.

--0000000000009c125805b3bcde42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure whether this works to let more people join the sl=
ack channel. I created a free slack channel for online talk.<div><br></div>=
<div>Thanks,</div><div>Peng.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">&#39;Slack&#39; via Jailhouse &lt;<a href=
=3D"mailto:jailhouse-dev@googlegroups.com">jailhouse-dev@googlegroups.com</=
a>&gt; =E4=BA=8E2020=E5=B9=B411=E6=9C=8810=E6=97=A5=E5=91=A8=E4=BA=8C =E4=
=B8=8B=E5=8D=884:54=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><u></u><div><div class=3D"gmail-m_-3735533=
558606386868preheader" style=3D"font-size:1px;display:none">Join your team =
on Slack. <strong>peng.fan</strong> (<a href=3D"mailto:peng.fan@nxp.com" ta=
rget=3D"_blank">peng.fan@nxp.com</a>) has invited you to use Slack with the=
m, in a workspace called <strong>Jailhouse Hypervsior</strong>.</div><div s=
tyle=3D"display:none;max-height:0px;overflow:hidden"> =C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0 =C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=
=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=
=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=
=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=
=80=8C =C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=
=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0=E2=80=8C=C2=A0 </div><table s=
tyle=3D"background-color:rgb(255,255,255);padding-top:20px;color:rgb(67,66,=
69);width:100%;border:0px;text-align:center;border-collapse:collapse" class=
=3D"gmail-m_-3735533558606386868background_main"><tbody><tr><td style=3D"ve=
rtical-align:top;padding:0px"><center><table id=3D"gmail-m_-373553355860638=
6868body" style=3D"border:0px;border-collapse:collapse;margin:0px auto 16px=
;background:white;border-radius:8px"><tbody><tr><td style=3D"width:546px;ve=
rtical-align:top;padding-top:32px"><div style=3D"max-width:600px;margin:0px=
 auto"><img width=3D"120" height=3D"36" style=3D"margin: 0px 0px 32px; padd=
ing-right: 30px; padding-left: 30px;" src=3D"https://jailhousehypervsior.sl=
ack.com/x-p1495803348528-1478122999844-1486512921109/img/slack_logo_240.png=
" alt=3D""><h1 style=3D"font-size:30px;padding-right:30px;padding-left:30px=
">Join your team on Slack</h1><p style=3D"font-size:17px;padding-right:30px=
;padding-left:30px"><strong>peng.fan</strong> (<a href=3D"mailto:peng.fan@n=
xp.com" target=3D"_blank">peng.fan@nxp.com</a>) has invited you to use Slac=
k with them, in a workspace called <strong>Jailhouse Hypervsior</strong>.</=
p><div style=3D"padding-right:30px;padding-left:30px;padding-bottom:30px"><=
h4 style=3D"display:none">Workspace name: Jailhouse Hypervsior</h4><table s=
tyle=3D"table-layout:fixed;border:1px solid rgb(160,160,162);border-radius:=
8px;padding:40px 0px;margin-top:20px;width:100%;border-collapse:separate;te=
xt-align:center"><tbody><tr><td style=3D"vertical-align:middle"><div style=
=3D"margin:auto;height:38px;width:38px;min-width:38px;border-radius:4px;col=
or:rgb(255,255,255);font-size:18px;line-height:38px;vertical-align:middle;t=
ext-align:center;background-color:rgb(5,118,185)">J</div><h3 style=3D"font-=
weight:900;padding-top:10px;font-size:21px;width:70%;margin:0px auto auto;t=
ext-align:center">Jailhouse Hypervsior</h3><h4 style=3D"font-size:17px;marg=
in-bottom:12px"><a style=3D"white-space:nowrap;color:rgb(113,114,116);text-=
decoration:none">jailhousehypervsior.slack.com</a></h4><table style=3D"widt=
h:100%;text-align:center"><tbody><tr style=3D"width:100%"><td style=3D"widt=
h:100%"><span style=3D"display:inline-block;border-radius:4px;background-co=
lor:rgb(97,31,105)" class=3D"gmail-m_-3735533558606386868button_link_wrappe=
r gmail-m_-3735533558606386868plum"><a class=3D"gmail-m_-373553355860638686=
8button_link gmail-m_-3735533558606386868plum" href=3D"https://join.slack.c=
om/t/jailhousehypervsior/invite/enQtMTUwMjIzMDk4NDIwOS1kMGVjZGM1MjU3NTExMjU=
zNTQ1ZGMxNmVlNzI3Mjg3MTIzZTRhMDc3NDgwODMzZmM2OGFmMjYxNThlMGJiMzZj?x=3Dx-p14=
95803348528-1478122999844-1486512921109" style=3D"border-width:13px 24px;bo=
rder-style:solid;border-color:rgb(97,31,105);border-radius:4px;background-c=
olor:rgb(97,31,105);color:rgb(255,255,255);font-size:16px;line-height:18px;=
word-break:break-word;display:inline-block;text-align:center;font-weight:90=
0;text-decoration:none" target=3D"_blank">Join Now</a></span></td></tr></tb=
ody></table><div style=3D"margin-top:16px;display:block;border-top:1px soli=
d rgb(225,225,228);padding-top:16px;padding-bottom:16px;margin-left:24px;ma=
rgin-right:24px;text-align:center"><h4 style=3D"font-size:17px;font-weight:=
900">peng.fan has already joined</h4><img src=3D"https://secure.gravatar.co=
m/avatar/bd1578dc29252dc0fbe1358b4daf5138.jpg?s=3D72&amp;d=3Dhttps%3A%2F%2F=
a.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-72.png" height=3D"40" w=
idth=3D"40" style=3D"height: 40px; width: 40px; border-radius: 4px; margin-=
right: 8px;" alt=3D"Profile picture of peng.fan." title=3D"Profile picture =
of peng.fan."></div></td></tr></tbody></table></div><h1 style=3D"font-size:=
24px;padding-right:30px;padding-left:30px">What is Slack?</h1><p style=3D"f=
ont-size:17px;padding-right:30px;padding-left:30px">Slack is a messaging ap=
p for teams, a place you can collaborate on projects and organize conversat=
ions =E2=80=94 so you can work together, no matter where you are. <a style=
=3D"text-decoration:underline" href=3D"https://jailhousehypervsior.slack.co=
m/x-p1495803348528-1478122999844-1486512921109/?utm_medium=3Demail&amp;utm_=
source=3Dinvitation-to-join" target=3D"_blank">Learn more about Slack</a></=
p></div></td></tr></tbody></table></center></td></tr><tr><td class=3D"gmail=
-m_-3735533558606386868email_footer" style=3D"font-size:15px;color:rgb(113,=
114,116);text-align:center;width:100%"><table style=3D"margin:20px auto 0px=
;background-color:white;border:0px;text-align:center;border-collapse:collap=
se"><tbody><tr><td>=C2=A0</td><td><span style=3D"display:block;color:rgb(67=
,66,69);font-size:15px"> Made by <a href=3D"https://slack.com" style=3D"tex=
t-decoration:none;color:rgb(67,66,69)" target=3D"_blank">Slack Technologies=
, Inc</a>
                <br>
                500 Howard Street=C2=A0|=C2=A0San=C2=A0Francisco,=C2=A0CA=
=C2=A094105=C2=A0|=C2=A0United States </span></td><td>=C2=A0</td></tr><tr><=
td>=C2=A0</td><td style=3D"font-size:15px;padding:16px 8px 24px;vertical-al=
ign:top;text-align:center"><span><a href=3D"https://slackhq.com" style=3D"c=
olor:rgb(67,66,69);text-decoration:underline" target=3D"_blank">Our Blog</a=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://slack.com/legal" =
style=3D"color:rgb(67,66,69);text-decoration:underline" target=3D"_blank">P=
olicies</a></span></td></tr></tbody></table></td></tr></tbody></table></div=
>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/01000175b15d52f3-97f15e86-058a-4396-b74d-6634837c5=
c35-000000%40email.amazonses.com?utm_medium=3Demail&amp;utm_source=3Dfooter=
" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/0100017=
5b15d52f3-97f15e86-058a-4396-b74d-6634837c5c35-000000%40email.amazonses.com=
</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd--AYp8fHSjECUbgF2pJ01Xme%2B0cjAVpXF%2Bm%2BGD=
qHUYNXQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAEfxd--AYp8fHSjECUbgF2pJ01Xme%2B0cjA=
VpXF%2Bm%2BGDqHUYNXQ%40mail.gmail.com</a>.<br />

--0000000000009c125805b3bcde42--
