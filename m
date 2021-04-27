Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM7UT6CAMGQEYN244II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3636C58D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Apr 2021 13:49:08 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id j128-20020a1c55860000b02901384b712094sf3983272wmb.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Apr 2021 04:49:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619524148; cv=pass;
        d=google.com; s=arc-20160816;
        b=pLf38iRW3+Nq0yRgYIB80ENdkpHhjEBo7clST9ZmG1XdodteAWGvc8aJd+dhnJ2tOD
         POooY7d5yoiBgRzkqOiMVB3FxFad38Vcpe/N7mgKNCqITEbHwgQdKdjt4mfUVr5inYoI
         GvsK40kh5E0DPPycbpdxE0dHbjfRCDDQU8LGgVhkr/8S0tjEMN1kM5aWsO3h+DWlxC8l
         c1LAxtQ2VQdzvtD3fDkcs37Z6UDtX7zFjilBtr+6xqw/hyqGFbdPPRfhMD0aW4/udonz
         ka6KP72RmPUHUYsTnCqlUJWd1fpuoTMZf2FBz8V35VXqx69BbTVQqI7zyMYZUoBTluvo
         qxYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rQyPK3oltd0nM4GvPmaxwMOZjoKX8bSiZYhBN2U0yLY=;
        b=lBNLjryk7fCMlE9mWe/K33YXljq8Uc3ejZFju/QsCi7BZkmGMiTh/476nt/p1Y0wbx
         J3aDA/FVcl8CVn+XdVAv5Mj5FyEsrdCa8vEpf3b338janG6jFAhQKzIaU1Q1YGsBsars
         XophiSOacytdPBDZrxH346ceUnD0xoNvWBzDp9gppgJOUiZn7XFXd0T5ZyFbBSqteWVB
         Jx9QSHie2rOj2f1Xfr/8++Xm8cLuGJLYbDOP1vw6hKHJvklGFDthcwQbjj5KhiwCNmYR
         GuOdHlYJsqrBlVg04LRG0Dky0AIuAeMvDIvlSWqIYtkE6lMISpYKDuTmoBefNP7xxFjP
         BabA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rQyPK3oltd0nM4GvPmaxwMOZjoKX8bSiZYhBN2U0yLY=;
        b=l85lxFKbbIRwXogojfSToFnKmKbNiQtOj+sE1yJxgwy/o4uBFYVQjMKpBKsyFAQ5E/
         7cxgpSPgJEr8dTEK1Q9ns2dZv3j0rBi9pkZrrskzGAs8DhKYNvTpl5kFVCLlA4RROsHp
         b3YVh8KLzxBAJsDrg7gJE7t3FFNpNWw6bDXQBPTphYAPYcGdvnmxB6N5Rx3jX3zqk/Go
         xDhF/i3WjPZ/sDNzv5oWrWqJkPy7sYVKxpBl94kob3gYOq+2oevlCWRo702Dq9WkeyWk
         TwN7citQZ9kok2YuTzBdWHChJ6D5Jnh1pr0Wwb2xrIuCSJ254ZrTPV/ju2SXY88UzATw
         zqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rQyPK3oltd0nM4GvPmaxwMOZjoKX8bSiZYhBN2U0yLY=;
        b=X741Qil+2nyEr67IQPLPhLHEsMA07DGucjG5pdGjAlna9a51zSmXiK6jTtWmySRdJB
         mZxn6YHmaFk087M2MBPsVYSu2/fdP53gq71hV6NvnGzqyWFAeP6eaQ9QGoReGCiAzQW+
         QH1pKmEb6z9ZyUAaQ7uwBt/1B4/FFRRPnCqjNrtZRIh/ie5xeCa2hjfbbFBQpcJ0p9c8
         fVzJF/8pUFRB3yDKojICP6TlflHbeb61CGzY7vj6iOBVHG5/8+8yJQovK/LwYo6DpPgi
         tMgBvqEgNkULUlHSfl/aHQzfRl5bKAqvm+F2+B0/3zpMTFb2adz1UcsbaO/I4+BRHZG/
         nn9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532z5lYfTl1q2gxln2bU47MJ76erY6LS4vMGrrfH3cI/0u4vzmNL
	P5eS7Is3dbcjHADanPYArLM=
X-Google-Smtp-Source: ABdhPJyKm30HVqXJA5+TvpXTM7SXmqZ84XIAJrHuIKyt8dtYLMEuzSo/3rkq26n8LuS0oIgE/7Uzmg==
X-Received: by 2002:a05:6000:1786:: with SMTP id e6mr28975642wrg.243.1619524148192;
        Tue, 27 Apr 2021 04:49:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:64c2:: with SMTP id y185ls1245614wmb.2.canary-gmail;
 Tue, 27 Apr 2021 04:49:07 -0700 (PDT)
X-Received: by 2002:a1c:a481:: with SMTP id n123mr3886881wme.162.1619524147088;
        Tue, 27 Apr 2021 04:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619524147; cv=none;
        d=google.com; s=arc-20160816;
        b=ofdAb9/9hN9grgsTPxPqyNO/GU2tKxfkVRc4GPGZy6Om2KTPANWT5U60IxKa1IDYaB
         id44LoBR2PxcyyNHgNARqOvuyc+fcocH1uSVAfaSeeNaFRZkmGsQWlEafog3bjD1p3PJ
         P+M0iRey37QDNiTL56q409GZvdrmDvzpOhQnwt2LnNNiVC8NScJzyWpslYBR+5noVF2h
         tBh/1QDx67wqj02QTMwuQNpOoRFxfGGSvCXHVL/WN83/eq2+VodHXvYcDNqzX+b/6jSQ
         uxVWqQ7/eeAFHMOXdNOWKg+nBC+YFgELj6AQGQH9SHhrmou70N51XTgM5SnaHXUq46Am
         UKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=AvAJaMein/GjUIPk9TcavNfc/+Tb/gx24vAoBpaaxWc=;
        b=eiAXtFXAEO57Bdhmggzr/k8EJTKeXnijoY9n0/fY70oGv5uSFImkYwi5C3ExMpf7pq
         ZT9Zgu2Q4A6FMHrksdOPyFj/tB2dJeEtg0dVJ5IxeVZ/au3/RsA9YIfpo8NFEIxPLtnc
         0h905qA93u2RVg2MNxyJtrRvYHxiLI0jKGXngIjPu6auqqoh1DetMt6PAN4I191FfZjU
         ogl250+N0q0n5LWlsWIHDPSzPgXscabyoNfnLo1Y07Fyt2+qDzGnHN7gYiOCt5Gj8H1Q
         Hzw4Wx8C7HjBDQS9dIEb7T82y8zqXk/UdNKJewlSArzQfjuRLDwgRx67JMR6CYIb1t6E
         eU9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q15si220505wme.1.2021.04.27.04.49.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 04:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13RBn5bE027145
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Apr 2021 13:49:06 +0200
Received: from [167.87.23.165] ([167.87.23.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13RBn58G021749;
	Tue, 27 Apr 2021 13:49:05 +0200
Subject: Re: how to run linux with root in none root cell ?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
 <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
 <72da73c0-f3ae-41da-af32-d81c26a5b884n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0a541a67-4abc-cce6-f677-7b4a1b86b99e@siemens.com>
Date: Tue, 27 Apr 2021 13:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <72da73c0-f3ae-41da-af32-d81c26a5b884n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.04.21 11:57, along li wrote:
> will you=C2=A0 share some indirection to help using=C2=A0 virtio-block ?=
=C2=A0 Thanks
> very much.
>=20

Did you study
https://github.com/siemens/jailhouse/blob/master/Documentation/inter-cell-c=
ommunication.md
already, how far that can take you?

Regarding jailhouse-images, I'm unfortunately lacking time to do that in
the next future. My jailhouse to-do list has some other, urgent issues
for now (not to speak of my general to-do list...).

Jan

> =C2=A0
> =E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 =E4=B8=8A=E5=8D=881:30:15<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>=20
>     On 25.02.21 13:32, Smith li wrote:
>     > Dear Community,
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have compile the jailhouse-images rep=
ository, and run
>     the demo.
>     >
>     > =C2=A0 the command to start linux in a cell is like this:
>     >
>     > #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /boot/vmlinuz* \
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -d /etc/jailhouse/dts/inmate-rpi4.dtb \
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -i /usr/libexec/jailhouse/demos/rootfs.cpio \
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -c "console=3DttyS0,115200 ip=3D192.168.19.2"
>     >
>     > What I want to know is : how to set the root to a dir or disk ?
>     >
>     > I see some=C2=A0 =C2=A0use=C2=A0 =C2=A0root=3D/dev/nfs=C2=A0 =C2=A0=
ip=3D192.168.1.1::****** :eth0=C2=A0
>     in this
>     > page.
>     >
>     [1]https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJ=
AgAJ
>     <https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAg=
AJ>
>=20
>     >
>     > Can't we set the linux root to a disk partition or a dir ?
>     > Will somebody tell me ?
>     > Thanks very much !
>=20
>=20
>     Jailhouse does not provide regular virtual devices like other
>     hypervisors. Everything is mapped to shared memory devices.
>=20
>     You may use network-based storage for the non-root cell, nfs as
>     suggested above or nbd. There is also experimental virtio-block, back=
ed
>     by a simplistic process in the root cell. But integration into
>     jailhouse-images is missing, so trying that out can be tough.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, T RDA IOT
>     Corporate Competence Center Embedded Linux
>=20

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0a541a67-4abc-cce6-f677-7b4a1b86b99e%40siemens.com.
