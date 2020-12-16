Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDU35D7AKGQEDTI7V5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 287042DC165
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 14:37:19 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id a19sf13353490lfd.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 05:37:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608125838; cv=pass;
        d=google.com; s=arc-20160816;
        b=hID+3RwxyqdZD/ETRdFtaD2/Kocf3e7015bVUfZjaRLFNob5a3BxaQu47KYmhwFYp0
         Mk3Wh5uJuYbJ1wyHkUHU30NgPnd6son4oxStu+2KI6E0S/sa2rcjT8YD2+Uy6PM2Mqp/
         UKKSmteAQJO/05Oa8mxl44jtgmOL6ZNXKyTEsDN+LjHEcvIjyKmpIG01Ua65qeGKYKwd
         ToAI1Cv9teJLUt7DRQksycb2I2IjJnNKLCzf974aDdpcfYRpUY8ltK5soJzq/WgsXR9S
         zIHx3fr+q+nYSgHj6hOGpXtHBa8TZ4Pg+ke8mfeEHkEJvnVZL3QDdPjiqyAwvS59NfS3
         /qDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=oFoK5S1xLeHZRBVEZb+d7kh7lywCMo6HGA8o44u4iDw=;
        b=SF3WIXCvsUa4RBvmzN/L32HY/jRTFECo50Qp6UjdQyPIW7xXTLDSfgY2fqWldp7H0e
         CFXNsWTIVY6ft1pqx97wj/EvCOOt8szMNxQIJ3TkZBcCRqN85WwtUiqL3wOz1/bMQHng
         uqFN3oCWXHN88umGKvWI1MaF8hW+vDLg9KW8lyxSnkQECu0i25bkQa137wpqJC87ETKa
         la8ZrBqz2AZIAuy0RoHWvW3zdx6O5e9aoXPLRu7qf/xHdnbyJcOIyKsW2VT15vX9hajc
         bCDPCmAInqHIL9NDqA9qKpSNrNeLg0m1XU8fP2IOCqa+52PgkePNJBC8jZcNCU76qaap
         tqIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oFoK5S1xLeHZRBVEZb+d7kh7lywCMo6HGA8o44u4iDw=;
        b=USoaLf+A93fF8vPGvOWD1JrwxRtXuoQ3AkX59ZYQdxZWgKE11LEJNB/VXnAMlp6GGj
         hrgxJ7Aj1p8mWdkE1xmmF6fhcUFX3waiCd2dMrfxGZf6ROFcelr03/akd1GqJTAXY8CH
         YQcF/ZDE5FkV3TDLfMLps9Dh3sDqoNAubbpAh04k3Wd78S3gSyCfFKG/wGrqpwEPYjVj
         A4dX2ddkzGxnaLFbpI0yf5vfl9VWyOqkFFEejyPW6AxiTEbXdyedVFr7EPiNMBzOrouT
         641KpjS094/SetAvwKFb5rWeySNO108v+7RD3WvHdUVRuY3bJkzbnphubnzW6Lmfoe1I
         YXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oFoK5S1xLeHZRBVEZb+d7kh7lywCMo6HGA8o44u4iDw=;
        b=Id95f8ESWmdxPSv0HjF4agb7B4dx35fTnN3x3+/fla4c7Hbu9s/muSvNFh7quO/qRE
         sn903yEqQq+24e66FSbybmRvfYPdKO1VE7fnuoOZ9lBJt7E0kq4hTmUDlyoJX8bdCNFd
         356u2QOudv9PZsihGL2YWTWsavchLUHrLID5DnwEyZMocSvvq29eRX3cy5Ddg5I8HlNh
         3RAZhQxYs4XBuTqzWHL8ugP9ZyZtSy4dc75FpDCIDgrF+NJr7ze/Q+uUJehJvBTxV3+F
         vCUnyeoUW9Nrt9xd0fGWTom1RP5VX2X01TKIIy1HLFXoxwJBkXMnZ3CkqIJUM/AT81gA
         RPPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309QFBESTnEKA92hQ4FBI97RDjTe2Xe1S4rSNmvKJlzgfHkkZOc
	qoyET1eD8IEXFeeSXE87FNY=
X-Google-Smtp-Source: ABdhPJwqs4ARTj2AxXqXGekCvFRjMllnduO/aj2K4JVPQVnJwslcxbuyDHjBosGdFMKZ1WSP4TAIpQ==
X-Received: by 2002:a2e:154c:: with SMTP id 12mr13981450ljv.210.1608125838593;
        Wed, 16 Dec 2020 05:37:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:980e:: with SMTP id a14ls2824004ljj.7.gmail; Wed, 16 Dec
 2020 05:37:17 -0800 (PST)
X-Received: by 2002:a05:651c:1206:: with SMTP id i6mr15265938lja.269.1608125837089;
        Wed, 16 Dec 2020 05:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608125837; cv=none;
        d=google.com; s=arc-20160816;
        b=gGhCCz1YPXr7t7gVCJxSFDLqnnpnUt7/W0jv37M/eDXGB/IsD95dlwFYiE9XrrI6oD
         ml5vDwuBkAPpjYoM7s+aZde4G7d6GaaAyc3cH7SzalmbGX9aUnsfAgBEy1KhvlbXKelg
         H9cO2VSY3h3AZGl6cCxKPT92Hi4VIABBBfcz4N4UNtNjQxxKFmmhdnVS7hfEu2Mmx3pX
         3Mx4M13KsgYjvPZid9NdwjeBOEqcZAiMvlnHQeAEgsopL16mzMK5INM2hGfycX9anPlI
         3Z8ZRzk9V1/bVmM0dBZcJEjISZLVTj3o05EWz3erJpIdwLrACvxuDtNPQbDqwqU51TF7
         2e8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9mEwETCHzmqYanJLum2VzPV8uIayuKgO6Hssy2sYq/k=;
        b=gD+s6WFQqHQPqL3ZTW3nsFY+MJTg1tmTRy4O9+I0YhkFiQsZghIXpsQT53OY6dL1pW
         lfHg++46SuNMQ0eEaqrcSyc30De/W1t8gx0efCw+KlE3WhH9PUr02JFe4BKPzM02bhSk
         FYPzi/Fd4sJSySDvtryllf09owi7+jWcszdrF9pc2jRfbqhy868pXHS7l2qN6w6Src8i
         2K3GyP0BMqY2T00SNw/4NGhT+klr58Cl0ehMy4NZR23ovumMmJC24Yh6P7jZ2324qkOh
         RLpennLbjvfAr/q9i16jjn7nkvdi0hlN4N+cE89GO6F/PxRrVT0ylW1iASl5tslMwGJr
         eE9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id c24si153331ljk.7.2020.12.16.05.37.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 05:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0BGDbF21024062
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Dec 2020 14:37:15 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BGDbF4u020171;
	Wed, 16 Dec 2020 14:37:15 +0100
Subject: Re: IVSHMEM-NET Verify
To: Fredy Zhang <fredyzhang2018@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8b9e7352-f3c7-e442-bca6-45c328a9fcb4@siemens.com>
Date: Wed, 16 Dec 2020 14:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 16.12.20 04:31, Fredy Zhang wrote:
> Hi,=C2=A0
>=20
> I am porting the IVSHMEM-NET patches on TI TDA4VM kernel 5.4. the module
> can loaded sucessfully. Can you please help to give some suggestions on
> how to verify the driver works fine ? thanks.=C2=A0
>=20

Nikhil, did you test that already?

Fredy, how did you set up the system? All on your own, following TI
documentations, or what was your guidance?

Jan

> 1. running the jailhouse linux-demo.=C2=A0
> 2. check the ifconfig
> root@j7-evm:~# ifconfig=C2=A0
> eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 50:51:A9:FC:B2:=
20=C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST=C2=A0 MTU:1500=
=C2=A0 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overru=
ns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overru=
ns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 (0=
.0 B)
>=20
> lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback=C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0.0=
.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=C2=
=A0 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:82 errors:0 dropped:0 overr=
uns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:82 errors:0 dropped:0 overr=
uns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:6220 (6.0 KiB)=C2=A0 TX bytes=
:6220 (6.0 KiB)
> 3. modprove ivshmem-net, it=C2=A0
> root@j7-evm:~# modprobe ivshmem-net=C2=A0 =C2=A0=C2=A0
> root@j7-evm:~# lsmod=C2=A0
> Module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Size=
=C2=A0 Used by
> ivshmem_net=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0327680=C2=A0 0
> xt_conntrack=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 262144=C2=A0 1
> xt_MASQUERADE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0262144=C2=A0 1
> xt_addrtype=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0262144=C2=A0 2
> iptable_filter=C2=A0 =C2=A0 =C2=A0 =C2=A0 262144=C2=A0 1
> iptable_nat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0262144=C2=A0 1
> 4. check the ifconfig=C2=A0
> root@j7-evm:~# ifconfig , I found a docker0 node. is the docker0 for
> IVSHMEM-NET ?
> docker0=C2=A0 =C2=A0Link encap:Ethernet=C2=A0 HWaddr 02:42:51:08:03:0E=C2=
=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.17.0.1=C2=A0 Bcast:172.1=
7.255.255=C2=A0 Mask:255.255.0.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST=C2=A0 MTU:1500=
=C2=A0 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overru=
ns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overru=
ns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 (0=
.0 B)
>=20
> eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 50:51:A9:FC:B2:=
20=C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST=C2=A0 MTU:1500=
=C2=A0 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overru=
ns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overru=
ns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 (0=
.0 B)
>=20
> lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback=C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0.0=
.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=C2=
=A0 Metric:1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:82 errors:0 dropped:0 overr=
uns:0 frame:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:82 errors:0 dropped:0 overr=
uns:0 carrier:0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:6220 (6.0 KiB)=C2=A0 TX bytes=
:6220 (6.0 KiB)
>=20
> Regards,
> Fredy

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8b9e7352-f3c7-e442-bca6-45c328a9fcb4%40siemens.com.
