Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA7S5WGAMGQEI5UOBBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id 57814458CEB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Nov 2021 12:03:35 +0100 (CET)
Received: by mail-vk1-xa39.google.com with SMTP id u4-20020ac5c924000000b002fe4e2bb06asf7714601vkl.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Nov 2021 03:03:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637579014; cv=pass;
        d=google.com; s=arc-20160816;
        b=gXm2EKPf72RQd9k21uEg6o6os/Q9vJ23VIXUnLOPUN2vEJqt+YbXLu+ZzEBUjMKa2Q
         +4Z0kqXepL36qD1cj5zDpiZPBrMZotfow/SNURFHmjfGbyQyOY9dBsZRxHsoCElIHjUY
         purKAY2ZDz0otBaOWqPmJPj2fyGcTiEUHyWrYTBIx8p3FV9jM6hv8Bzc2Gtuv4jrO3Oc
         7dZI6w/VML6Hum/u8dnhBZt9KvfHBaXJvKuNspxAiZN/sBBBjzUK9dXO8/cqgak3Esyj
         z+z57YiaUd55FtrWQlxHzK+VXlEmth7nVDRb+WnWzxInLBlN1wdWW3FDq3QjnyZQo1w8
         ZBqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=guxV+qd5hzpCn8KCuLgzUDfYln8OAR+KfC422cI7fME=;
        b=GSEIlyDOuqwSj3cY7R56s+tTZ9tahhXOoVndpGYD7NgHgfRG923TzNMizOv8FAkJF3
         goyKQT8ktXLgKK4RP4E5rdiqU/zYUVPJAOq+Bt3TVF0YmEfPhDGdqAl51oeOWRzp/HAZ
         l3+P4IyFSYfSTUKGErff4JnmDUkWKVfXRG8Mh6i6k1R8LxLPzBu81SNTEpxMwzE6e68A
         tL+Xw6R1+uKPAmIYXs4QGuMZjVpLEZjxysMxdNiGsF72KLb5RwYl0lAjbV2hVnSRkN/i
         jlxOw61j6yHAqc7sh921odKP8sLjZv9bNOnr6g9MMWSKPvopvcd8q3tnCwaDChCbD3G/
         Zyaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=guxV+qd5hzpCn8KCuLgzUDfYln8OAR+KfC422cI7fME=;
        b=HBt2hLWpSEZkZezxpkZDj3OVrn7CNApsTtRRkU0Ze6IzWsoVFYjxkZoL4lMK4+71lc
         M0mxQy8eHqfjItj7C00GNug8154fA6YwGAnjKZLZ/MC3cRhzERSVK1Z4X15naNwulpXz
         z++JageuKhmxchZs6fTfyXjb1XD+F0llv+27TuECp998jlF3GqUupqOZ2MKerzQyDUJx
         qEL5P+gZ/Yvw5zqQUFwXurJlgGNuRLWbspKJH6cRfpqLCVnYq2MAEpn/Mbv8l4UNhDpw
         NXGWcGoqy5bknMycDQ+X8DKZrKEJwNhhGNANTOtJfKS0zKQxUdzTN686/L0YBeEbt2/Y
         AUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=guxV+qd5hzpCn8KCuLgzUDfYln8OAR+KfC422cI7fME=;
        b=0+dI/RUw/6uvYTZhrRkZJ2TfyhbGdBIHXohR5X/rWoz3OIH3Ggdh0nyNIJOxL5SOYX
         MDecH/Od/2sRPIKm5ZXrQD2DHVKkS05b0h52zKy0qbSY8l2AB8+hhi9gJq03PjEcbgKp
         v97exKHuVm1vTLhhToMMS87VmJluw/Zi34iOi/7ojIsFbx7wkl/HSe+4RXf5OmG7kldH
         8ESgMdKAQLakUlM3IPAYnSUp9oBcJtjqGeJaceHU3d69Mb1JtLPuGLCCHqBa7jGC4fkc
         hT3gCjbGaid+0w/W3TTEEOyoZzaYNlPRuWpYj3qlywicEecj35w5/xxaYOUVKFYuQ9Md
         gvew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5300FZTRLUv3EtN00p1hjgPKpTL9/Nr1dSGdYxdSC4gP46Y9/27S
	7NBHTufdB27Qv1DQlMmh9hQ=
X-Google-Smtp-Source: ABdhPJy5FwSoQ0l3sGbm1vB+xUnM5z3Q+DSYYoaqB192bApYJm2FkQD+86lKhKsJrksae2dsHhNw0w==
X-Received: by 2002:a67:1985:: with SMTP id 127mr32559989vsz.34.1637579011956;
        Mon, 22 Nov 2021 03:03:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:b009:: with SMTP id z9ls2418436vse.10.gmail; Mon, 22 Nov
 2021 03:03:31 -0800 (PST)
X-Received: by 2002:a05:6102:ec6:: with SMTP id m6mr85425350vst.50.1637579011296;
        Mon, 22 Nov 2021 03:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637579011; cv=none;
        d=google.com; s=arc-20160816;
        b=s76s6QY1ZWxsJSEp4n9+otCTIASWG56J32NTklGqMeAzr2Dj20ILvOj96Gq/rRVGA4
         9pEjPPis6ZrFzNvtCsD0Yn6+/0DP/Pud2xNZAUcAYAuLV8M6f3FlR2/wFU2IKunT5/cY
         NdvsKfSRGEaypd4muC1+481OOKuJRj3S955I1/FXDDMgslg+wQ/xjeTMRjfSJwgV9gtD
         +xDLRE74XsZEwEE/dxC/2+WT+ZiAY5fv5bUZ5WVgE/uG+lQPSg7v4b2Cgo69BPTuwlmv
         cgSGf0gqIwd/9QGpheIrPAI+ygjLaqucTWE2KOoMJj+IBG7QoirbLhjVg88LH5xHwqlz
         orig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=USkNnEcnK+y9h3NgoDYFUWozSKYAToF4BHh+S+R4Tkg=;
        b=dZTMfT4AG/GB4B/holOKdF/NhEgTJJ5eSny+Qi3Nk1+xd6qxnIhPls8A/F91+WvBcY
         R+iOwvCpTxU6IeJKbqk+ZoMKx9SN43Na5UY4wqaoQZ1/f9JuDiTPpfIgTtWD2TLlmSMg
         fN5ri/NRwU8a9Rv7+RkqIaIn8tqMgQ7DLchLDOXL2lh8BFfj86miWRjm+RcNSrSLX8aP
         oDvZBYCguBIPsQRJeGYj6ImsNcdhxJwCoTvkye8NdhUdvNECMVOxkuPTnko6rzIYINmr
         PsENFm+nPdRVRu/cMTmwOVCRni2F5e2Tk+EwmsLSt/y4enr8FFBZx7KO8qrG0qGWtZ1N
         rstQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g8si793934vsk.0.2021.11.22.03.03.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Nov 2021 03:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AMB3Rhl003011
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Nov 2021 12:03:27 +0100
Received: from [167.87.32.217] ([167.87.32.217])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AMB3RSc026615;
	Mon, 22 Nov 2021 12:03:27 +0100
Subject: Re: [jh-images][PATCH 4/4] Add kas menu support
From: Jan Kiszka <jan.kiszka@siemens.com>
To: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1637430993.git.jan.kiszka@web.de>
 <0a01dd4ca08e9e2163c76bf043a06e8a2fa88bec.1637430993.git.jan.kiszka@web.de>
 <bb08169b-1e0b-44d4-8c45-69c0f349e15dn@googlegroups.com>
 <5e925a14-d8aa-f150-d8af-4bfa59eb1c7a@siemens.com>
Message-ID: <69a90870-65c5-ae42-0467-84526a1a45ee@siemens.com>
Date: Mon, 22 Nov 2021 12:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e925a14-d8aa-f150-d8af-4bfa59eb1c7a@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 22.11.21 07:30, Jan Kiszka wrote:
> On 22.11.21 00:56, luigi.d...@gmail.com wrote:
>> Dear Jan,
>>
>> I've tried to build RaspPI4 with next branch.
>>
>> This is the log error for
>> ./build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootf=
s/debootstrap/debootstrap.log:
>>
>> Resolving deb.debian.org (deb.debian.org)... 146.75.62.132,
>> 2a04:4e42:7f::644
>> Connecting to deb.debian.org (deb.debian.org)|146.75.62.132|:80...
>> connected.
>> HTTP request sent, awaiting response... 200 OK
>> Length: 87944 (86K) [application/x-debian-package]
>> Saving to:
>> =E2=80=98/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-=
r0/rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.de=
b=E2=80=99
>>
>> =C2=A0 =C2=A0 =C2=A00K .......... .......... .......... .......... .....=
..... 58% 7.94M 0s
>> =C2=A0 =C2=A0 50K .......... .......... .......... .....=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100%
>> 2.54M=3D0.02s
>>
>> 2021-11-21 23:51:22 (4.21 MB/s) -
>> =E2=80=98/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-=
r0/rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.de=
b=E2=80=99
>> saved [87944/87944]
>>
>> *chroot: failed to run command =E2=80=98/bin/true=E2=80=99: No such file=
 or directory*
>>
>=20
> Looks like as if the build started as non-Isar build. Could you provide
> the full log of the console? You can reproduce this by simply calling
> "./kas-container -d build" which will rebuild the previously selection
> menu options, now with debug output.
>=20

You sent:

> This is the full log by running "./kas-container -d build":
>=20
> + mkdir -p /root/jailhouse-images
> + mkdir -p /root/jailhouse-images/build
> + docker run -v /root/jailhouse-images:/repo:ro -v /root/jailhouse-images=
:/work:rw -e KAS_WORK_DIR=3D/work -v /root/jailhouse-images/build:/build:rw=
 --workdir=3D/repo -e KAS_BUILD_DIR=3D/build -e USER_ID=3D1000 -e GROUP_ID=
=3D1000 --rm -t -i -e TERM=3Dxterm-256color -e SHELL=3D/bin/bash --privileg=
ed ghcr.io/siemens/kas/kas-isar:2.6.2 -d build
> 2021-11-22 10:47:59 - INFO     - kas 2.6.2 started

That looks fine. What may also cause the issue is qemu-user-static being
installed on the host distro, preventing the required configuration in
the container. See https://github.com/siemens/meta-iot2050/issues/219
for a similar report on another Isar layer.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/69a90870-65c5-ae42-0467-84526a1a45ee%40siemens.com.
