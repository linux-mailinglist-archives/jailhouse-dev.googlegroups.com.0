Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBAE36T4QKGQEKJQEJRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D90249BCF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 13:31:14 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id o8sf25553426ybg.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 04:31:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597836672; cv=pass;
        d=google.com; s=arc-20160816;
        b=0F1xDBuEQYo+Rd45eT86p4dL1dlNErUCNcLPFwkR1gfomIj+mKTpCEoqrtCX9vBm/K
         Rbpoox3ZF/XbdvDCrMotnphH6zKMj8rL6nL4/prwvi0F9ZQrNH5dz9Ww/HBMDv4hbs8G
         QHUMyMSb+Oyemn0eMUiJEK8D5QITkcsgPJ0sTHYWoAzN46AmKjQXZLv3zr04vDP/n3PG
         /6207MMPLb7wCxtHjCwovQU+xSLTOPMQRD4ujD3aGmX5g0lmjd+3/N6Wz4fw7vKEx+0C
         EaUnzkWSL82onozIv8KEYZ6YTjtClt3QFM9Vj7wlO8rx56snhDO6KrdbSzcRQWUOMtab
         7+zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=yu4tGWwju6frc9Tfp5GB7q0XzNhaJENdqqvKdP1R3aU=;
        b=Yz5XvJQSZ9Uf7EHtcAG4KlFOe44IPiQA43C3r5aBc3lkFY6eiMYuin3fYpS4eArCtT
         qWkuMKkH3wCFqjwRoQ/WzhJByFk+ISpizIMagPGTU6TTxEKyJf7FX11vaoGepT1o7I/t
         mMLVrbFO763GIECdPSm5TX+kOF45+xHbzIfbGpu6eDa4Q2rhinraJXQu94w4iLPgwWJk
         1Bg+blJ+Pw4G2jttQNTjAg3O2XSdcqu3MrVnVNHng1AyxXgH5GAiZAtj4KKpyptaQnBI
         8WU/fDaSVEDnSFOIiY7zvzRGQ5PAeX/2jmsyCoxbr0ZhK0D2lPdMD4qT7b86XJjvy9Yf
         bLRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=iEPK+OX0;
       spf=neutral (google.com: 2607:f8b0:4864:20::243 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yu4tGWwju6frc9Tfp5GB7q0XzNhaJENdqqvKdP1R3aU=;
        b=HV7NPMSnpgnLh2jH3D8QnL0b1OXf8tIULZsJ5+d9TI29B4Klc6SVJT/ysnGd2tGOyU
         fiXXHNDh0ayJ15P7zhwmTRIEkl9TtTtFlGRu4LprYcaVR8xEjcY06f2wzrErorENw3S8
         pTtAqPb6rxwVST4aYxJomlw0MbqFar7QxO6YQaycHjipMislZVpOO2K/VtgrXxX7CZwx
         v9QYSqpqUH4ihAvIeA1F5IEm0zPsrwjfG8xFJXSQc6udwlacA2654rPkTSphWn9q3rw/
         CTYNMzJa8tdQK+b12OXsQbAiLNYZyDG7zEtX7aXDpUX8W7NP+iOO/fVp62O3MuZwwcka
         HlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yu4tGWwju6frc9Tfp5GB7q0XzNhaJENdqqvKdP1R3aU=;
        b=noxnX+AOmvvL/FloV5vnJ1TrGTHSzqcB/ZsMfYN5trdgPDsUB5g6goV7Z7J4UyGM+p
         HucPT+OcF3bkcS72SXEiZFbng4E4T7eBlmCPkvDQTwNjqVmkgJoNz7wNLlY8v9RUkWO9
         U/1jswOIkrXIPGl+AGkqCAcCJU9EnZY+o4DifOQu2K77qP5Z4gzj8yZuj6GSAzCqDssQ
         zVjVf9e/JUxLDqIaAUvAwmZNIY0d74Vu/baJkBQgfCXsp9s+A2U8w8Cl4h0qeEldWNM6
         8Gnmh/uffAmFIeFuWDANKwh1yVcWpwfQNzDYZw97plODs4UMT8a+1QxTSlRVPAuWhu+v
         qaFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532IKjHn5MevA7xYW+KfDDtboV1witaplupAAkDR7eFH624Nim0B
	4tUDSXIPM0w85CRF0LtfhhM=
X-Google-Smtp-Source: ABdhPJzdXJ48goa09IQcd9PPHDn1C/tb6S1vMKBM7Ucgz/TDaRNkHIzYC4M/byBRkobXwAwGCPUW6g==
X-Received: by 2002:a25:9885:: with SMTP id l5mr36451914ybo.0.1597836672423;
        Wed, 19 Aug 2020 04:31:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:840a:: with SMTP id u10ls9650262ybk.0.gmail; Wed, 19 Aug
 2020 04:31:11 -0700 (PDT)
X-Received: by 2002:a5b:d0a:: with SMTP id y10mr34775579ybp.128.1597836671890;
        Wed, 19 Aug 2020 04:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597836671; cv=none;
        d=google.com; s=arc-20160816;
        b=O4eOXq84Izbq32yHm7x+SPoM4qYXgOcLs5UfBjd+Kpypd43rbMDIxcdp/fRqVysUC9
         zvLMgUbI9XHCopSLXvQJmLJQ8A6/imUE7nML4N3YIM+1rmGNQi4i79xGamc/mR07MHqS
         pCNtg0cXIhqEWmR8yEA2T/rGmCT7jxYJ6ndUZSYC7hLvT8i4L1tH1FAG2+U6bHAoJI4k
         uyHVMCAeyyP+xBZihwn22DrPr80TKvRQAXIqxPDf7iwgwOdbtHrsSIVRBpWnUrS6GwcE
         emaLUqjp9hmx2/sfCQ8hxUhQeZnj+KiTUIz8ksWERDr1uVMaUQPK1OVK2oUglv30EgZW
         rLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=taVaj55h6DJ8MNPXC1gLJX6TqFnr8D6Ialu3NBwFHlQ=;
        b=OOmsb/8oc1CXs1eEXwKn1IKFNKDZvhDp/gy8CmX6YAyL1cafd2romkNDlCmDIeMv0M
         mInXD9wLvfWUkzmlwSec/aYDmM7orSw0kHWL77H58bPWgnWjnkaWTybfx+O5p4u3WKHF
         ToTnZkC7xqzZKfoK697TJ5a/AcBXM66wZk/HuJJY5nZLL5hwwRLkr/wiCMS5FtPqcyMc
         9Ac9ffZOGwF8w8smxNN5qBqzR8goJ+bytdCYk4ocFTKMwMFVbRkyr640caoVQZ8t6N0x
         gErSa7g+GBR86JbN8h5NZetnlVHt8CkHSdWFlQEVGEVN0774vMOodp4VuwQi+3WQQ/fB
         RDgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=iEPK+OX0;
       spf=neutral (google.com: 2607:f8b0:4864:20::243 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com. [2607:f8b0:4864:20::243])
        by gmr-mx.google.com with ESMTPS id o14si1009775ybm.5.2020.08.19.04.31.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 04:31:11 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::243 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::243;
Received: by mail-oi1-x243.google.com with SMTP id u24so19558575oic.7
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Aug 2020 04:31:11 -0700 (PDT)
X-Received: by 2002:a05:6808:b12:: with SMTP id s18mr2718870oij.171.1597836670982;
 Wed, 19 Aug 2020 04:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200817171736.78100-1-jakub@luzny.cz> <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
 <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
 <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com> <32baa43a-4e84-7f22-230c-bdc5fba33c76@uni-tuebingen.de>
In-Reply-To: <32baa43a-4e84-7f22-230c-bdc5fba33c76@uni-tuebingen.de>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Wed, 19 Aug 2020 13:31:00 +0200
Message-ID: <CAGdCPwuAGqYaeUik+c1oFX=Zo3JmDmm1JdyMiYPPVyi4ovGvQg@mail.gmail.com>
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of memory
To: Christoph Gerum <christoph.gerum@uni-tuebingen.de>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000002ef2b705ad395723"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=iEPK+OX0;       spf=neutral (google.com: 2607:f8b0:4864:20::243 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--0000000000002ef2b705ad395723
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2020 at 13:03, Christoph Gerum <
christoph.gerum@uni-tuebingen.de> wrote:

>
> During our work on autojail we also had the assumption that
> .pci_mmconfig_base needed to be below 2^32, but we could not find a
> reason for that in jailhouse. I was think, that this restriction was
> either caused by the linux driver or a misconfigured device tree. But I
> will revisit the problem in the next days.
>

I have been looking into that and the device tree generated by Jailhouse
might be the issue. When I move the .pci_mmconfig_base to 0x200000000, the
generated device tree looked like this:

   pci@0 {
       dma-coherent;
       #interrupt-cells = <0x01>;
       interrupt-map-mask = <0x00 0x00 0x00 0x07>;
       ranges = <0x2000000 0x02 0x100000 0x02 0x100000 0x00 0x4000>;
       compatible = "pci-host-ecam-generic";
       device_type = "pci";
       status = "ok";
       #size-cells = <0x02>;
       bus-range = <0x00 0x00>;
       #address-cells = <0x03>;
       reg = <0x02 0x00 0x100000>;
       linux,pci-domain = <0x01>;
       interrupt-map = <0x00 0x00 0x00 0x01 0x01 0x00 0x96 0x01 0x00 0x00
0x00 0x02 0x01 0x00 0x97 0x01 0x00 0x00 0x00 0x03 0x01 0x00 0x98 0x01 0x00
0x00 0x00 0x04 0x01 0x00 0x99 0x01>;
   };

At first, according to [1], the #address-cells must be 3 and #size-cells
must be 2. In Jailhouse, this is taken from the parent node. I don't know
if that might be an issue.

But it's weird that the reg property is just 3x 32bits. According to the
Jailhouse code at [2], I would expect it to be 5x 32bits long. Doesn't the
kernel think that the size is 0x10000000000000 or something similar?

[1]
https://github.com/torvalds/linux/blob/919ba6e739eb76d7a99284795b72c45e096c9aa0/Documentation/devicetree/bindings/pci/host-generic-pci.txt
[2] https://github.com/siemens/jailhouse/blob/master/driver/pci.c#L408

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwuAGqYaeUik%2Bc1oFX%3DZo3JmDmm1JdyMiYPPVyi4ovGvQg%40mail.gmail.com.

--0000000000002ef2b705ad395723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 19 Aug 2020 at 13:03, Christoph G=
erum &lt;<a href=3D"mailto:christoph.gerum@uni-tuebingen.de">christoph.geru=
m@uni-tuebingen.de</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
During our work on autojail we also had the assumption that<br>
.pci_mmconfig_base needed to be below 2^32, but we could not find a<br>
reason for that in jailhouse. I was think, that this restriction was<br>
either caused by the linux driver or a misconfigured device tree. But I<br>
will revisit the problem in the next days.<br></blockquote><div><br>I have =
been looking into that and the device tree generated by Jailhouse might be =
the issue. When I move the=C2=A0.pci_mmconfig_base to 0x200000000, the gene=
rated device tree looked like this:<br><br>=C2=A0 =C2=A0pci@0 {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0dma-coherent;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0#interrupt-=
cells =3D &lt;0x01&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map-mask =
=3D &lt;0x00 0x00 0x00 0x07&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0ranges =3D &=
lt;0x2000000 0x02 0x100000 0x02 0x100000 0x00 0x4000&gt;;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0compatible =3D &quot;pci-host-ecam-generic&quot;;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0device_type =3D &quot;pci&quot;;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0status =3D &quot;ok&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0#size-ce=
lls =3D &lt;0x02&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D &lt;0x00 =
0x00&gt;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;0x03&gt;;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x02 0x00 0x100000&gt;;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0linux,pci-domain =3D &lt;0x01&gt;;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupt-map =3D &lt;0x00 0x00 0x00 0x01 0x01 0x00 0x96 0x01 0x0=
0 0x00 0x00 0x02 0x01 0x00 0x97 0x01 0x00 0x00 0x00 0x03 0x01 0x00 0x98 0x0=
1 0x00 0x00 0x00 0x04 0x01 0x00 0x99 0x01&gt;;<br>=C2=A0 =C2=A0};<br><br>At=
 first, according to [1], the #address-cells must be 3 and #size-cells must=
 be 2. In Jailhouse, this is taken from the parent node. I don&#39;t know i=
f that might be an issue.<br><br>But it&#39;s weird that the reg property i=
s just 3x 32bits. According to the Jailhouse code at [2], I would expect it=
 to be 5x 32bits long. Doesn&#39;t the kernel think that the size is=C2=A00=
x10000000000000 or something similar?</div><div><br></div><div>[1]=C2=A0<a =
href=3D"https://github.com/torvalds/linux/blob/919ba6e739eb76d7a99284795b72=
c45e096c9aa0/Documentation/devicetree/bindings/pci/host-generic-pci.txt">ht=
tps://github.com/torvalds/linux/blob/919ba6e739eb76d7a99284795b72c45e096c9a=
a0/Documentation/devicetree/bindings/pci/host-generic-pci.txt</a></div><div=
>[2]=C2=A0<a href=3D"https://github.com/siemens/jailhouse/blob/master/drive=
r/pci.c#L408">https://github.com/siemens/jailhouse/blob/master/driver/pci.c=
#L408</a></div><div><br></div></div><div dir=3D"ltr" class=3D"gmail_signatu=
re">Jakub</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwuAGqYaeUik%2Bc1oFX%3DZo3JmDmm1JdyMiYPPVyi4o=
vGvQg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAGdCPwuAGqYaeUik%2Bc1oFX%3DZo3JmDmm1Jd=
yMiYPPVyi4ovGvQg%40mail.gmail.com</a>.<br />

--0000000000002ef2b705ad395723--
