Return-Path: <jailhouse-dev+bncBCF23YV2QAERBN6KUGDAMGQEMKQ3J7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD83A7908
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 10:30:48 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id bt32-20020a0565122620b029030e2ef98a19sf3508716lfb.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 01:30:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623745848; cv=pass;
        d=google.com; s=arc-20160816;
        b=HGsaKLO0/hNlbth3QbCoYOvhS+UPRDknR+hMS2Z8Wh8STve9HAM0j0nec58vIM2ZzH
         j8BUAk5uhM2lWcZW6v8osVBq0rgGvzGcXDITrQdDP3pAkMZ/s3BD2xxdmvXT4v0CYqyB
         O1Vp/k0s09cWVI1aac9hFl4j1eH1trFci9UqFCD/7sCs04d9OJ2oEJH5PdJEBH1yVNDP
         r0K9VHgQjMp60Odk4MWsSzSwCX0iDV9Jxxsa7YhIxXYQbR7lebWoqskm1LWKvmVl3asC
         3Pixy5Q8m66zz4HmM+VX8wiTQv5RjJ5B4T+nPJsd3XESf1Q8I3l0SVpCZfmy2BVfuaiM
         b0uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=RwBBdBpLyvUocoylU9cDqd1sXdBq09lLZkW2YQvB3RU=;
        b=uAKKQ8vA7ep1b7iWXqMMDmV25SQmh9THWk/wt3mxacgskt9cdUPb6zgjcwo+T2Jayl
         4smViJvKwYtkdgQgQpuoeSbBiC8MVBAcHXBdgpdJnE+lmioaGH3UqIJHLXele3QhmOpY
         6FnfI62BJwdL2U3sLgbjQRPXdWblwKY9aMxsDyc4BnDK9xAkRz7JFwkHIUaE9VlQl0wc
         RYpJLguBic6e30fvbZxsdBVQ9ZNtPH5QWJZSzZqcorrTYPg3thZVCE6NKJ2dvLagShTZ
         sXH/pep+t3+faGe5ctD9iPkhc1F58RpNzfKnO16Snty65YqO8p9shGio1bc3v+JzHFB9
         +U2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUiUuvaA;
       spf=pass (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::434 as permitted sender) smtp.mailfrom=zhuzhuzhuzai@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RwBBdBpLyvUocoylU9cDqd1sXdBq09lLZkW2YQvB3RU=;
        b=guhTUvw8sMyDJaz0a74rlBEDka3UIUMy7MPyYLJ4viPwt53h/7Uw5LPDsF4D5RB8gz
         jH/rguGDWl+2H6F/st+BSdyiAwt1XANTNTKePfPW3txSjHKxK/TTUzcXxWEtW0x+H39O
         8rWRlwQuuQzy2aeUqEmYB0SnwHYBpLCl9GqtBF9x2S6F+K5Jc56if+LmAmBUBXzcEUD4
         58Y45yYxIT3xN5LIGrZvtcE24/jInMXM5Mkws5KWA1zyU0ouz51SdXNUHTzqr9ptHuyX
         gDr1v9hfcBtihcgKxzc8AWfNbmiuS/E0m/21dL2UuU7Ld2TN0IrKfLMgnrww0zxH+/bl
         NCJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RwBBdBpLyvUocoylU9cDqd1sXdBq09lLZkW2YQvB3RU=;
        b=MHJ8D4w1D/t/cO/XuHdkeb0EuVCGbSpaT8owgYOObSO7U7OTqzZ0m5Sa6tML4R0Ct1
         PGJqdwaB7GUCODGH+WtHFRIstdyUa0Ha8RfwhG4k2r8PfRYmsAdxOgO59EX85wDromEi
         dQVExb1bcOJPQ0dYFTam8jLVjczuzsqoBTGKu4GI7NUAxsBvioEVXte46fKlNTEwPCBi
         pE37AViqii7qK5NcxcxeFLdARCeBPBy/UInDi0qRC6bsBPd06aBgrpNkXNg+M9RqEGJ0
         SyNmCMwBFk1CRtnf/Ic115KEHHZFFurouTPWZoHkMGdsA7iOvxbkjgkSNnPgjy34nMAa
         wZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RwBBdBpLyvUocoylU9cDqd1sXdBq09lLZkW2YQvB3RU=;
        b=L8Dc4msOIySBbc2SOUaNlq/WPyspWjZ7Xd5qvuC5ywNfTI1lDyaBqToXYg4EHu6PQy
         IXLCTQb1MQ4cyPnQ3EF9Sar0VKzIbc7Cp72Xk2hwB3HxW5l4QrWnkYX7M1dhBNX59quh
         tWNyZkXqma8QGDF99DtrDhgYsC1LRDTBQ++7Xc9yTPLPkJOr1j0mz/Nd278uOUej5I50
         otF6KSuNLcPKnE/rY30LCajuT4rEVJl5xa4bINQEF4UBBQ+ibQy6V8xBIV5c0KXQKaO1
         /EDJPeRsOxgaL0eV9ciMCjVBsOYo/dMB9evbPz4A6CR7sBTJNz8kjMLIlRlElBrhWuDw
         mEWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531XjeYpQLsIWpD8Gg4EzWLiqMEIBprAp2vuo9WegG3IJ5Z0UWjI
	F1gMSKmf2gJxfwGhg8qWe0A=
X-Google-Smtp-Source: ABdhPJzk5HFtEH2YgLfOQHRvbmKvSAcXjovnDdRrz/DyHMZzHS8vYbCWjoVphL1P9ohseogK6qmhPw==
X-Received: by 2002:ac2:5f72:: with SMTP id c18mr14616926lfc.81.1623745847907;
        Tue, 15 Jun 2021 01:30:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1025:: with SMTP id w5ls4205348ljm.0.gmail; Tue, 15
 Jun 2021 01:30:46 -0700 (PDT)
X-Received: by 2002:a05:651c:20c:: with SMTP id y12mr17004969ljn.428.1623745846861;
        Tue, 15 Jun 2021 01:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623745846; cv=none;
        d=google.com; s=arc-20160816;
        b=r8L1oJk+N56TR3u9/0579xi8bMGnkDPeFhDx0luPPXig81qwnMzCIdtLvNMSUKquAB
         vxSTpxrDHPhh+G5fZQBxBmxL7TdW6eSlfLwVACjevLKGbF3r0nVPavT3+Da9qGIvK5Lx
         f9ZYalRgFYG+xnVR+rJc14GCawprbvei8wokLaQQJ3mm4GjQFCDfpzR2+rn+X2W05bbS
         wmsyNAM+vUNbmr1pn5BM783AbBtm/XK0IHQ39+vBeIQ4vsatihkNbKL1/ENxsDqxDTdJ
         lcepKYoqRZ6ER4zgdkCxuHy3Uz61XX9CU6hb5OTa93H+TleMj3tp0lSVm2Y/1qOnuW6q
         4RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n4pM/G0tNheEz5tfnR1uO5IKVd/Al6xT9UcodJx1R9o=;
        b=L6dboa29sOsqJhJUw2v4kse/ADHIoHIOJT31Uj/1DgwKqYW107uWOhDhllrASZjaP2
         j6C5X6hJKCsvroYC4jeVHI3id2hIyINSJscY1IQUPHiw8u4T8RewGZPb49Y2N/wPWfhi
         DO5If3HrCnd8F5iRKdSsU7ntpEV4W9g90Io9OHDHA8VzowOeA5zNU5rVENyZHc+26l9f
         4tKiZ9XQ3FW69xN9CzF10eejfSqtl4iDDDfEplOh+Ou9MXka3kWhDBr4dW4/5KrqGUQO
         U82sx0mm8SD2Ar1C9sNUqFVOlQWumiPPEWLMqxPUUOl9YswWYS5FZNnxEZJZrvajlmjd
         toSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUiUuvaA;
       spf=pass (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::434 as permitted sender) smtp.mailfrom=zhuzhuzhuzai@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com. [2a00:1450:4864:20::434])
        by gmr-mx.google.com with ESMTPS id f6si70171ljo.1.2021.06.15.01.30.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 01:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::434 as permitted sender) client-ip=2a00:1450:4864:20::434;
Received: by mail-wr1-x434.google.com with SMTP id c5so17308650wrq.9
        for <jailhouse-dev@googlegroups.com>; Tue, 15 Jun 2021 01:30:46 -0700 (PDT)
X-Received: by 2002:a5d:564a:: with SMTP id j10mr23720686wrw.171.1623745845984;
 Tue, 15 Jun 2021 01:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <cff6a936-9db1-4edd-bf86-236b7277dea9n@googlegroups.com>
In-Reply-To: <cff6a936-9db1-4edd-bf86-236b7277dea9n@googlegroups.com>
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
Date: Tue, 15 Jun 2021 16:30:35 +0800
Message-ID: <CA+nU6V87Gav167NNkHbiZ4zx=rwd7F1xskpSv5tiBacQ6Rnqmw@mail.gmail.com>
Subject: Re: arm64 config of jailhouse
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000005b040805c4c9ca76"
X-Original-Sender: zhuzhuzhuzai@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=DUiUuvaA;       spf=pass
 (google.com: domain of zhuzhuzhuzai@gmail.com designates 2a00:1450:4864:20::434
 as permitted sender) smtp.mailfrom=zhuzhuzhuzai@gmail.com;       dmarc=pass
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

--0000000000005b040805c4c9ca76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For example :
Every entry in /proc/iomem , should I add a memory region in config?  or
just need that entry flagged with System RAM?  And how to define a region's
permission?

Should I get the every reserved-memory in device-tree and add a relevant
memory region in config? And how to define the region's permission?

Then where can I get irqchip field and parameter of it in config file?

Thank a lot.

=E6=9C=B1=E8=8B=A5=E5=87=A1 <zhuzhuzhuzai@gmail.com> =E4=BA=8E2021=E5=B9=B4=
6=E6=9C=8815=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=8811:16=E5=86=99=E9=
=81=93=EF=BC=9A

> Can someone have ability to write the config of dragonboard 845c or via
> the /proc/iomem and dts .I use the autojail to get the config
> automatically=EF=BC=8Cbut fail to enable jailhouse .
>
> --
> You received this message because you are subscribed to a topic in the
> Google Groups "Jailhouse" group.
> To unsubscribe from this topic, visit
> https://groups.google.com/d/topic/jailhouse-dev/Tah6FQVcg0I/unsubscribe.
> To unsubscribe from this group and all its topics, send an email to
> jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/cff6a936-9db1-4edd-bf86-2=
36b7277dea9n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/cff6a936-9db1-4edd-bf86-=
236b7277dea9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2BnU6V87Gav167NNkHbiZ4zx%3Drwd7F1xskpSv5tiBacQ6Rnqmw%40mai=
l.gmail.com.

--0000000000005b040805c4c9ca76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For example :<div>Every entry in /proc/iomem , should I ad=
d a memory region in config?=C2=A0 or just need that entry flagged=C2=A0wit=
h System RAM?=C2=A0 And how to define a region&#39;s permission?</div><div>=
<br></div><div>Should I get the every reserved-memory in device-tree and ad=
d a relevant memory region in config?

And how to define the region&#39;s permission?

</div><div><br></div><div>Then where can I get irqchip field and=C2=A0param=
eter of it in config file?=C2=A0</div><div><br></div><div>Thank a lot.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>=E6=9C=B1=E8=8B=A5=E5=87=A1 &lt;<a href=3D"mailto:zhuzhuzhuzai@gmail.com">=
zhuzhuzhuzai@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=E6=97=A5=
=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=8811:16=E5=86=99=E9=81=93=EF=BC=9A<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Can someone have abil=
ity to write the config of dragonboard 845c or via the /proc/iomem and dts =
.I use the autojail to get the config automatically=EF=BC=8Cbut fail to ena=
ble jailhouse .=C2=A0

<p></p>

-- <br>
You received this message because you are subscribed to a topic in the Goog=
le Groups &quot;Jailhouse&quot; group.<br>
To unsubscribe from this topic, visit <a href=3D"https://groups.google.com/=
d/topic/jailhouse-dev/Tah6FQVcg0I/unsubscribe" target=3D"_blank">https://gr=
oups.google.com/d/topic/jailhouse-dev/Tah6FQVcg0I/unsubscribe</a>.<br>
To unsubscribe from this group and all its topics, send an email to <a href=
=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" target=3D"_blank">ja=
ilhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cff6a936-9db1-4edd-bf86-236b7277dea9n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/cff6a936-9db1-4edd-bf86-236b7277d=
ea9n%40googlegroups.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2BnU6V87Gav167NNkHbiZ4zx%3Drwd7F1xskpSv5tiBacQ6=
Rnqmw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CA%2BnU6V87Gav167NNkHbiZ4zx%3Drwd7F1xsk=
pSv5tiBacQ6Rnqmw%40mail.gmail.com</a>.<br />

--0000000000005b040805c4c9ca76--
