Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWP227TQKGQET7BRX3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A933E34
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 07:10:50 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id k18sf9529171wrl.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2019 22:10:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559625050; cv=pass;
        d=google.com; s=arc-20160816;
        b=p6Jo3NZNx6YYS0aDpVNl7niNP5o6vxDXPe911usXZkOlCz+sjWNc4GW4gQLa4y8yyd
         OqFJfi5LsLQFCkwp0fi+U5WLyCHJjs3sb4GYBic7kwgaTbrMTdEmBVDJgeGaDwLxWNJp
         dwbK8aW9FM2R7XPIMgFkaK/aKlskk9gFQYPqWVnCvseIGbGtEZwnmWORUjQb5FvRozCb
         yRyPHeHLykw+MoEqcA2jfzYtndCUkiknzV/Puij0z8wNrgqYd0TjRcvgxIUbgxv2bCC2
         icawxtpLyDWLOTq5T0s4rcpeq1FlcvdJ51gyHq9+3obdAXGYvWCecFO/yC1pFQn3Rniy
         zTTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=kumCjXsUICSScUNizcHm91Z34clNPDNjg8kYfjR+9lc=;
        b=wzoXjXC0Ivni0DwZMqEcjWOPMwHsgjWjhB+yRRvADyKQooyjsBwTo6pp2wCKksRPjq
         LaVUEDyM24DQn5kUaJ8W9LNlGpcBTy0QOV4rCq5/vDvIUfEykKqJ3Dp95ByveWkuV7QI
         X/7KKKw3Xge/AxdpNSIIb2W7GUn3iJWNEU8zUsep06w3zg/fzZKc/6TEox4cWzbVZs7c
         Buk0SDCyk6OzopT3bdmFSmn4z8ejtGnhsW0S1XawhV33eOLZ9mnmjsbRQN3tOnaJ9eyA
         yDtEriPbqrxqfmoX2h9VTlnJfewSRlvcKmH00BCkVFPFU5WmxYR9n6qgQFJ9vqY4sk+u
         YCKQ==
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
        bh=kumCjXsUICSScUNizcHm91Z34clNPDNjg8kYfjR+9lc=;
        b=dIl4lpjMPGOwO/6fAVwBNLtASRosxHogxPao6dYt8kJcJvYRqp11KReJ1ltAoH0elN
         B5ctHFfevgDaZL/hVUBgUVZIC28dw66948eDe4pV0dodLHS3OchcFcTKyYxx0HXPzPGf
         dOecZqXDIQH2OggryPZ7DWuUDSvOkkAq4Gg54U10X3qmMXLUhYD0vTYxH2tZf1H+bjNO
         6KqMDelOL6GwXmnT7NlO0VaiPRJiGcB8ikDbIk3x3wYz3Uvhhg62gtpuF18gxml2YL8v
         G3MGWlyoQcJwW8ruznvv1lsmCenhszGtVm+DMPZaBgTf2SVSs9fZIfXgg8OmcXWThFyW
         fbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kumCjXsUICSScUNizcHm91Z34clNPDNjg8kYfjR+9lc=;
        b=mPtGNt5lWpq/UoyuY10nLAqnv6T0a3VFZ1kgyHYYjpyag8u18PRRAjwqoJ1uomc8PM
         PWz9IAZQIlUCUTTa+VMX+T4KM32A4axGCMX++Mz80xXPM5mFOW5CiwxQmCvOUF9vEIs+
         NXyU1qeWxrzO5BDLraSJz93KRL9rUrfDi35ESUmTRFxc5CZLIX2P/KU1jT4wqmy9274N
         LdHDWaNmfwSBpA/DUmTfTKwKewIHZTq5nwMLOY/w0cySD5OqkSExH609SACI4sbXEcAL
         H2pLHjDU49Kf8Jc/nhKJg/Vbt33SX3B1XdInvm6s5hOBQbCQgaw5iTC8/719Wm5rNJit
         DeVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5MtaJ/6Q7uT0kAdq+hBjzY2DpTiXDvO1OAOg5in8xfvs4DjJh
	J54/3zgOxPAK9WodNbf+NVc=
X-Google-Smtp-Source: APXvYqxum2RZHdkyMvJddpFPcTmpOloAGCGaafZAuJty3IlLK0zOrc3yMhtW9THwYX5/XUiDjh9o1w==
X-Received: by 2002:a1c:b041:: with SMTP id z62mr17700597wme.113.1559625050021;
        Mon, 03 Jun 2019 22:10:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls1602954wru.0.gmail; Mon, 03 Jun
 2019 22:10:49 -0700 (PDT)
X-Received: by 2002:adf:eeca:: with SMTP id a10mr19879338wrp.266.1559625049223;
        Mon, 03 Jun 2019 22:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559625049; cv=none;
        d=google.com; s=arc-20160816;
        b=l5yc3Rao4rf44xJ0DM5VeboF31uB+W4SCIXGWhYA2bsS0HIUjr3mUZh5iqX7UK0iL7
         ddRs675d4pWqIxSQIvk3X2yztoQwHj44TRI5gvlY0D5tCh/MU7twqjyY8YU7Ehc1XrDD
         wi+MBDSTKTuqWZojKbWoo2khIKpghaAvfUfjnSfN0hZlt1wcPvyTQEGjS2lGo2uiAeMl
         iadw4VHczsuBFhxKmP7XkTI4umGKQM/+kgJ1caFurTEYGHbF1Gxe+4XKSAFOqmNeWDOM
         7JNhzi6QoTsnD1PUktkIDhFi/HwXmjsorxyWBRksBeYEpo+atTY3jH03xOoitBhTpxkl
         ximQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=kBcU9RylbnHmEypk0kDUskkRCQPrl6tvMFTCYn2qBdM=;
        b=QgBHVd5DxIB+mxqmefIQQJEA8Y9sbaNchgG66UcrhbQeKZEH+Cb2z2Je+5CyLlGvMz
         rhjfPmt3XBap9Hm62oBOXkEAbgNuw3hbYFXr1I6F3VjotAah4iPvRRKAnYkEKrLPKA2e
         GdnAQn377o3eZ03WaRebnsf3b3R9Js+fyHHo1X0+ir9Mm0K1dz9/f0jMg9buA5V2fxys
         DlsnNNDhSGEDFAPzq1ayuXou/Tm8dpR8rc4QeDMG1FFxms3VI9dVO/Hn2WpkZCXLqVe3
         B9uRY8a91g3g0vGUtcapqgB1kosQuMveGFfB8OMj1yiyATPLIMUC9BNwNuXmApqu54XT
         xKlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id p3si91336wmh.1.2019.06.03.22.10.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 22:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x545Am8Y031495
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 07:10:48 +0200
Received: from [139.22.36.57] ([139.22.36.57])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x545AmMu004564;
	Tue, 4 Jun 2019 07:10:48 +0200
Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
To: "Xiong, Lei" <lei.xiong@siemens.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9b0508b3-d040-4093-2b69-e3db932b0b51@siemens.com>
Date: Tue, 4 Jun 2019 07:10:47 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Hi Lei Xiong,

On 04.06.19 02:46, Xiong, Lei wrote:
> Dear colleagues,
>=20
> In the =E2=80=9CSetup on Banana Pi ARM board=E2=80=9D part, it mentioned =
that =E2=80=9C*since v2015.10,=20
> you need to disable CONFIG_VIDEO in the U-Boot config*, or U-Boot will co=
nfigure=20
> the framebuffer at the end of the physical RAM where Jailhouse is located=
.=E2=80=9D
>=20
> My question is that how to disable CONFIG_VIDEO in the U-Boot config?**
>=20

Via "make menuconfig" during the manual u-boot build - which the descriptio=
n is=20
not covering in details. If you do not want to fiddle with that, I can warm=
ly=20
recommend jailhouse-images [1] and a board that is supported by it out of t=
he box.

Jan

[1] https://github.com/siemens/jailhouse-images

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9b0508b3-d040-4093-2b69-e3db932b0b51%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
