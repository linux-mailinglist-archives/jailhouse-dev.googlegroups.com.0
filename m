Return-Path: <jailhouse-dev+bncBDE3XXPWEAILV25H7UCRUBFOVJZTU@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 166972ACAE2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 03:06:52 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id h12sf2272808ljc.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 18:06:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604974011; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZABXrq0Hn2y96fNC5L+NldD4exHVnNGjvaVG+/DRfn8PuPpZkI46AuqsKPvHOKtfoa
         JyCpQ/oXM7qw1Y20HS4+6BF4NaTMR5cr0kcb5jjYNpf9D/bQXFyUpx5Z8Hp85ohsHAXs
         NY/kSTccZy/NBOhpczTO8OIHiyrUZjnR+0EqGrtB3uUDsKO4X9nUZhc4Mwp1U+xTGk/j
         1t8UMmty7Dm/rtoazEV/GYu4oaKcyhOKSDa2feng3MJOZBYqm8NqNz6/cva8fFhFOeI6
         2MQNL5Q17YfzuHXCYNxIb3jKLtFIWo+wi8fmtyPhrNwCscf0U0iQclGrLRxKK7GIfvsg
         n8lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=0+ulQIpJfseTuoo4kzsgiFyKtZOoVSjeohhKIFhRP8E=;
        b=q5bOzLJ/LgWGqzSMs+vLiJiW+ZcJDdrOXFZDK+GqHhI5jr3kpDwPn8UyXAfKSpdZBc
         9k1vMqNbyg9MFJVpvh+eQ3NlhctwtokEvGToaVX5PH62cERBmtBZOhsHPp58sZQ0ZrMG
         Lwe8aCRxi7UAAz/AkXcaDxgHUyjYCMThAt1ro6SEIQ4cNLyRmeRcxxC1XObE+84Z3KVs
         zIKDIUm0tiNZ/i/bNGnmXGhnjUI++uPZUnsgMsJjA4MzzmSSl22SYTs+I/rHktTuqqxk
         TFdrO6WVBW9AndBdVI2SOeAWjq8EyBD+Xqru8IYLwlgvRMprxWX/0HgeNKInBGC9y4X+
         07pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0+ulQIpJfseTuoo4kzsgiFyKtZOoVSjeohhKIFhRP8E=;
        b=fe0Tfdgs8wWN8rG/A9f0GK3EpYuxsfuEgenDU33BhWeJLSEk+PSIItVy5Zt5pSbqvm
         ADNxJq5JnhG78HCEJwvULQ9i/INInYZgJQ+knNLAasZV7KMl1AQUg3oi8oQIMbO5LK6s
         99/NcZ/k1HW8FVQ4NRlEa0YQY3NqSz2qna9mwH0moV0CJDVpvwdXE/Mq8DWTEIrbDTe1
         iXivrQbcpakxGZ+v/WaP6QT7hF7LlV/MxzKXBapWTd0YCsUYytAQ6bhujVLl/FBn4XCY
         KC5KlPWPvHehcjLOBfci7j1CmZSYIPwZnRNakQby3ySerqhFGkzaEbBvgEUyPXSx1HyC
         cTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0+ulQIpJfseTuoo4kzsgiFyKtZOoVSjeohhKIFhRP8E=;
        b=VGjlRdf53ArpEZ7AMzY36g5mf3shA9F/f1vbhV602NNLDtlYi6y0dRpfXnoP9fqege
         x0YU+iXe29ym7WmvcyGZImySZ6JmooOtQqjFDwjEPeXeelcy1ShqUBG3IsGJ1+7r75dR
         edC4qQJafnLQ6kuG6gYKJDe7nNFsXWjxOptFpK4tfK815OL+FSeGKIzHY13qCiH5e7K1
         k8Cm5qdEBsfNa/EDuR9Jx0Cprs/kkqZOErrMIcpQczqU2/fPhmngHKkiHw/Gz5kksLWE
         QXvAW7Wr5nSLzwZjhY/fSVvSbvyO5asNKMCmy2FCShcuFowoFpaD3st/qWPOYTaP5IfG
         SHmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dhtJm72gwawM7Jo6JMNOoCMSfh098NxP3I+5s8owVofZeA0k5
	xRY1S1DCl5k1xtKMtdud/ig=
X-Google-Smtp-Source: ABdhPJzuDfw5TU7y6xVO06YKp1caLprtq0zTG0DEm4FfA9BzcCmKdVXTWLyPWATmcEPNI+lojdZpeQ==
X-Received: by 2002:a19:5510:: with SMTP id n16mr3586010lfe.135.1604974011540;
        Mon, 09 Nov 2020 18:06:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b6d4:: with SMTP id m20ls1809235ljo.1.gmail; Mon, 09 Nov
 2020 18:06:50 -0800 (PST)
X-Received: by 2002:a2e:8141:: with SMTP id t1mr7515219ljg.8.1604974010115;
        Mon, 09 Nov 2020 18:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604974010; cv=none;
        d=google.com; s=arc-20160816;
        b=eqlvoNYZNf41dtSa3xwTehouj7En8yOE1T0j3IXVUOOMrrrPKd60ZTVN7za72LNBpn
         OdgS5MLfKMr9f1sOQDa78gIdGwLJq7qyGhDrMc+2DcJyGDEUuOZupqU1CVNJR7/cWEO8
         9R8DnYWF85rGW/I+2ntI7eqcYz5YH+roG46z3DAoNktqLJ8xFOSdSZx2Unrf09wHe7Me
         //6V3WPUaWz9TgSESFdaAUVMtHUTlgDSz8PqOpcFH3kcSWAEWO95FBY3peckGa4UieDc
         Sz/LSptdG5HUIOG7onPsDFu/JRyaOsBc2We8BrlvLqxyXaYp/kjjfM7JiUW7sAhZAXp8
         77Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=xorLbI4Wp7ZswnRJ81xDwqrTD4Rmw3MaGGKbosVPgHA=;
        b=yVkJuCsc9sF7Ao+7cVsGVWSP/WBwoRjcXc3Tnm/+6HFX7Iqz/GXnzAMEWky8MOUXJu
         I85nGbtIR+JUxoMsFFCrPAT2YFM6u5T99fIxXqaNmHc8q+bQZ2dHCDZBmERr/x9lsv58
         bOsZkVo63B+9cdvYzS2LGk41rDaMOf/ucXm/JPHbuyUS81zRv56oJ+9CQYbHM5pG/ti5
         7glicq47bCR9LR6oLsUBh/xIVCQ9op+K8m8kxoLBodYMEfvkNoKGLv8g/YGiQOh7uSKf
         Eho419cPHiEsKiLe3+FuW6rCv9a8ik9RrINUSZaz+DA6yiGjsrI5j2miAGVxwgZmEiIL
         Kt3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
Received: from fsasmgp07.fiatgroup.com (mx2fcms.fiatgroup.com. [212.123.238.164])
        by gmr-mx.google.com with ESMTPS id i17si387461ljn.4.2020.11.09.18.06.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2020 18:06:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164 as permitted sender) client-ip=212.123.238.164;
X-AuditID: d47beea4-3346770000002776-f4-5fa9f5b950ed
Received: from MXPQ3FGAW.fgremc.it ( [151.92.70.145])
	by fsasmgp07.fiatgroup.com (ESMTP IBM SMTP Gateway) with SMTP id AB.FB.10102.9B5F9AF5; Tue, 10 Nov 2020 03:06:49 +0100 (CET)
Received: from MXPO1FGAW.fgremc.it (151.92.70.126) by MXPQ3FGAW.fgremc.it
 (151.92.70.145) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 10 Nov
 2020 03:06:49 +0100
Received: from MXPO1FGAW.fgremc.it ([fe80::b4b3:c124:c673:3e00]) by
 MXPO1FGAW.fgremc.it ([fe80::b4b3:c124:c673:3e00%20]) with mapi id
 15.00.1497.006; Tue, 10 Nov 2020 03:06:49 +0100
From: "Liang Jingyan (M)" <jingyan.liang@marelli.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "Xiao Jianhao (M)"
	<jianhao.xiao@marelli.com>, "GAO Zhao (M)" <Zhao.Gao@marelli.com>, "THOMAS
 Deuilhe (M)" <deuilhe.thomas@marelli.com>, "Jiang Depeng (M)"
	<depeng.jiang@marelli.com>
Subject: RE: [J7] jailhouse hypervisor in TI J7
Thread-Topic: [J7] jailhouse hypervisor in TI J7
Thread-Index: Ada0BUq2fZ+ea6OYTKyzqIhrUlxtBQAGff+AAAK6kYAAtkXtcA==
Date: Tue, 10 Nov 2020 02:06:48 +0000
Message-ID: <0fe28eddb98b46fa80ee49b866d84ed0@MXPO1FGAW.fgremc.it>
References: <e2ab7c14fd244457a1faeb99ff0fe5be@MXPO1FGAW.fgremc.it>
 <20201106102901.i4qk35q4g6eqglhu@NiksLab>
 <484b82e2-8f05-485e-49e0-4e0ddbab989b@siemens.com>
In-Reply-To: <484b82e2-8f05-485e-49e0-4e0ddbab989b@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [151.92.70.225]
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsUyPcZtou7OryvjDXbNEbN4vcDE4t7Nm8wW
	c88mODB77Jl4ks1j+8lJTB7Hb2xnCmCO4rJJSc3JLEst0rdL4Mr4//MmU0GLRsWXU8+YGhgb
	1LsYOTkkBEwkFq2Zz9LFyMUhJLCFUeL7vLOMEM46Rom1u6awQzg7GSUe7DzDCNLCJmAqsWlq
	J5gtIqAhMffqTbAOZoFVTBKfLu1jB0kIC+hLrHvVxwRRZCCx6dFyNgjbSeLnqpVgNSwCqhKP
	m9ezgti8QPEnnQvYILYtZpR4M7cdrIhTwF7i59qFLCA2o4CYxPdTa8CGMguIS9x6Mp8J4gkB
	iSV7zjND2KISLx//Y4WwDSS2Lt3HAmErSrz8PQloAQdQr6bE+l36EGMUJaZ0P2SHuEFQ4uTM
	JywTGMVnIdkwC6FjFpKOWUg6FjCyrGIUTytOLM5NLzAw10vLTCxJL8ovLdBLzs/dxAiMtyvV
	75bsYDxxwekQowAHoxIP74FXK+OFWBPLiitzDzFKcDArifA6/VsRL8SbklhZlVqUH19UmpNa
	fIhRmoNFSZz3mxJQtUB6YklqdmpqQWoRTJaJg1OqgdHV/WXQ+0lztPmOFs9q8p7Hd0aW3ytm
	m5vmbAauP4c+m+ZVRijmK5Z8lXul5fZRf6Ft86dlP8QZ8tMP3eFpdl4tuad59aoPz0U713Bf
	v+lXYRZ+9cvJ2kWrQ9NtlO6slNpZ9ZrhY3jCutKeW1f/JllN0PCI4K0+u3LKYr+W10/nTyuq
	TXsa7q7EUpyRaKjFXFScCAAoddZ+swIAAA==
X-Original-Sender: jingyan.liang@marelli.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164
 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
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

Hi Devshatwar, Kiszka
Thanks for your reply, it's helpful for us.

Also there are some additional questions we want to know.

> MM Question:
> 3.       Does the hypervisor have some KPI data?
>=20
> such as below info
>=20
> a.       How Fast boot time when OS mount filesystem;
>=20
> b.       How Fast boot time to show first image?
>=20
> c.       How Fast boot time to play audio?
>=20
> d.       How Fast boot time to show RVC?
>=20
> e.       How Fast boot time to run second OS filesystem and touch?
>=20
Devshatwar >> This varies across different platforms. There is no benchmark=
ing data for the TI platform
Jingyan >> If there didn't have the detail data on the J7 platfrom, is OK. =
However, what we want to know is that does jailhouse has some fastboot solu=
tion? Because now the jailhouse start is depend on the first Linux(Of cours=
e, the Linux optimize should done by SoC Vender or Ourselfs). If we want to=
 Show image/audio/RVC(Astern imaging system), but this function is in the n=
on-root cell OS, how can jailhouse support it.

> MM Question
> 17.   How many resource usage when the hypervisor running? (such as Resou=
rce usage: CPU, RAM, ROM)
>=20
Devshatwar >> Currenly, for TI platform, 6MB RAM is reserved for hypervisor=
 There is some CPU usage when enabling hypervisor and using VM management h=
ypercalls. At runtime, Jailhouse is involved only while handling the interr=
upt injection part and IVshmem
Jingyan >> In this case, we want to know some detail data about hypervisor =
resource usage. With upon answer, we know the RAM is 6MB, how about CPU and=
 ROM? We know the CPU use should be very less(Like < 2% or < 1%), Is there =
a detail theoretical or practical tests results?

BR,
Jingyan

-----Original Message-----
From: Jan Kiszka <jan.kiszka@siemens.com>=20
Sent: 2020=E5=B9=B411=E6=9C=886=E6=97=A5 19:47
To: Nikhil Devshatwar <nikhil.nd@ti.com>; Liang Jingyan (M) <jingyan.liang@=
marelli.com>
Cc: jailhouse-dev@googlegroups.com; Xiao Jianhao (M) <jianhao.xiao@marelli.=
com>; GAO Zhao (M) <Zhao.Gao@marelli.com>; THOMAS Deuilhe (M) <deuilhe.thom=
as@marelli.com>
Subject: Re: [J7] jailhouse hypervisor in TI J7

On 06.11.20 11:29, 'Nikhil Devshatwar' via Jailhouse wrote:
> On 06:30-20201106, Liang Jingyan (M) wrote:
>>
>> 14.   What the hypervisor have got Safety certification level?
>>
>> if no safety certification, pls share some introduce how does it make sa=
fety?
>>
>>
>=20
> I think the smaller code base, deterministic resource allocation and=20
> other decisions are taken considering the usage of this hypervisor in=20
> safety critical systems. This shoud ease in certification.
>=20
> However, there is no certification done for Jailhouse
>=20

...and that is because of the lack of a suitable hardware platform - up to =
now - which provides the necessary safety properties in order to use the hy=
pervisor as a safety element.

Certifying the Jailhouse code base itself would be doable with reasonable e=
ffort (we actually discussed that with a certification authority, T=C3=9CV,=
 already). However, that alone would not help you if you cannot map it on s=
ome real hardware. Check, e.g, if you can get a safety manual that covers t=
he A-core MMU so that Jailhouse can rely on it (and/or check it during runt=
ime) for establishing spatial partitioning.
You can also watch [1] on that, namely the discussion at the end of my talk=
. It's old but - to my best knowledge - still valid in this regard, unfortu=
nately.

A good share of these issues we are currently trying to address via hardwar=
e/software co-design in a research project [2].

Jan

[1] https://connect.linaro.org/resources/hkg18/hkg18-115/
[2] https://www.selene-project.eu/

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0fe28eddb98b46fa80ee49b866d84ed0%40MXPO1FGAW.fgremc.it.
