Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNHPQLZQKGQEAU2ULZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B7917A135
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 09:26:29 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id p4sf2600283wmp.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 00:26:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583396789; cv=pass;
        d=google.com; s=arc-20160816;
        b=IeC/7r44RGV/U8TFh3e+sFDWGjpnqBn/kS9glNE+pG5NbzL8ZGNkj8cu7KU59osHxT
         t3LghWh5ql/JxRr7lj2sBw5hPRGPX9lkccqGZo9evPhAiR0W8saOFxDhP1IuCsP457O7
         sLet2lhWQJkKdiV9mpXONLvb8Qr1DLjjhuszrt4VUBEmUOnn48R1/aR0/4YE4VFBfaA6
         qUWNMgq++PS6vNT7109mXMsHDgPLCELcNYCPnwr/vmjtJWOEb7hefN6ZZtZ8ivAgM+LJ
         PGXr2BKPIA+sAZsdTjD7yz7rJlumeBrKOMWQR+Yl7ryySu2lOKCuv1GVOHBVqLF34laK
         NUgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=FaVe56pIlhqqmk4fA03KsnxJVRI4HunSZqt3wVftSsE=;
        b=Q4Pymg5oeUzj+7WNfqD4GUWebDpHExxc0t+X1p7EXUhY7+ceMiStKDIq5m5tk+WPT9
         BAtsNKafi0HzAp1F4os5QQm/0SxSvcdMHpmAOgaOLy/ZP4GTkFoPht2Q9hJagglSQ67p
         Yg5vr+ZVCZfQKhyzD/+c+2RRAdl0NNG7rCFoqiylj+O4vWUYkvB531L/AMEeUKEtfQWs
         oGWlO8G9vMIlEvm8cK4EY0RNXHY9bnoJt8IxFB1522WdDEOGxvCP7YASNacZ7ZzVyibt
         J9ddjho5tr7ISfRua2XciJwvcDY3nd+pl0+LtshHrPIgKAXLtWr8AhYk3PouNKHhQM4R
         SflA==
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
        bh=FaVe56pIlhqqmk4fA03KsnxJVRI4HunSZqt3wVftSsE=;
        b=XAuOBxs88TbI9uQeD/m0j+dUdLCjTr7HIYy3fhnO4GM6V0pE2XK2IzLhD99Sugup+p
         iQnfRyVteBYAmzodS9WZam3mE4E+HLA8AnXEA/a2RK6T9GgK/jDQgC4s754u2NA7U7S7
         w1a7X/y99tNd2TzbwXWEGnO5JM2mjLxJ+PYeib0L2cNXxcuiWpvk6mRw+k2VOPytkrK7
         91qMLLLD56U2/neL4cpp1iT9FUTS27/kmec7AQribEarIpNjmBkoPSbDqZlEow/CcyQn
         xx2C1/TJHdvyTcUdond+WUyh2GKTlCAVuqdxeCNnsx5Z0tpgr/mjyR0WjNJ9E5gGInOm
         rd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FaVe56pIlhqqmk4fA03KsnxJVRI4HunSZqt3wVftSsE=;
        b=HvVRZ/pW8DZhDHJy7xmNHiRvtHFILTjTqXvnP4EW+/8MyomE8NVBQAhYlu2nwVsm3W
         7VoVEIaKDMtADUEIkk2T/nEh4LUzUz7b7kBrS2k6ToOtNdbJED/JqgJvTbG7QZypHL/F
         Wwx7omLhiO4w/4XhPeCuEClSB3Aoa3LSnRYkQZEQlYcQeOJR0vFYny8EZXkOI/FeyvDG
         92C8fgP5Dg48VWG4IMIQqzxJqnK6WjUQOXeg34uDUQtAY8M8ZVsrQ75ExKOBoOhRdKSn
         WFwnql1TnSxpybH5UNp6rEF8r5MCoOCUr/3ztRygklNohnNChNDfKWl+xpfAhKEzb6v/
         WDwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3Hj1447nH1txuGerjuZpwQYz7SqihV4p6SMu20xrWeh9P3H3DN
	kPtp505TjWbO5HyQLLA8Kdo=
X-Google-Smtp-Source: ADFU+vtcsDXf7ZHOjJUWpoE0XOha7ydC5Xo8JiKstEl+0j6Fc5aUMCF/kuZAjT2TSxjG6aCDQZhKng==
X-Received: by 2002:a1c:156:: with SMTP id 83mr8364171wmb.151.1583396789227;
        Thu, 05 Mar 2020 00:26:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a5c6:: with SMTP id o189ls559404wme.2.canary-gmail; Thu,
 05 Mar 2020 00:26:28 -0800 (PST)
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr8637461wmd.185.1583396788424;
        Thu, 05 Mar 2020 00:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583396788; cv=none;
        d=google.com; s=arc-20160816;
        b=DHshapaA/X5bkvflSkuzFwpg+lALC28iQ9Y4AJjkIN14oxbsacg1wzUYEf0aVSrUwZ
         GXn8uOsA9AHCi332BiNOak66UvxtNoUTOWJzxmYQmC37YXnIHaS4+75JiKjYIYT3WgKj
         f0YNmuk/8nck+Ab7wxQQ8Gt8dKUfs7ki10n3Gy2aBF36zSbFatTghSwt6eqY/R/icm5l
         NuM0HkAe0P+njREG6tBa6Mb018BraAdH3eaxMclTCCsi8QVxFGCVCjdHQc4VFbLNMBnm
         j7kr5fY2EbF7F1ZlRkA0ie+rRKwGCAYiZqre24UUSaRsX/ZnvtH04Ev1oON8x/um6r0I
         lM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=FHjH7GVozu22jEsL1Rp4eMxEpxWhEhF8+I9+iBamXLQ=;
        b=DpmyzmAD5unsf4YPlJnRc4MAY/kqZdbzBqV6iAMo052gIIgWqK7PlqJUIvWz+AOitj
         Naba505cCsGJDoo+gebpvKddvpE9xcjNl6nBAF+jLSX9YOLCHLg31VgouD8TI9S2nNSm
         Vg7bbe8X1Qf/v6o7VAJR63hVYrpLX9/U7Br9Ox0EksITQm2CP3Mv30G9o/DuSMmvv6S/
         fcS2GjUZDqgi8MjP2MFNH+l3/MvMiSxPZOMx33eccKlxvoaljftTIOiVv3cYLY8Hsisk
         JOhK4KKQj0Af/so2AsqS1Y2YyhkArsyOuJOKx47kCvmvQOd2NyVsxPDL6yeLxq9Yugl1
         2cpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w20si410552wmk.0.2020.03.05.00.26.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 00:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0258QREk007611
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2020 09:26:27 +0100
Received: from [167.87.29.210] ([167.87.29.210])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0258QQHZ010043;
	Thu, 5 Mar 2020 09:26:27 +0100
Subject: Re: GSoC 2020
To: ahmed El-Shreif <aelshreif7@gmail.com>, jailhouse-dev@googlegroups.com,
        "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAPkDTbCy_BBCuvNsd8ZLAYtC=OAjY5E1mvqh-Sw==YS=m5TetQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <03946472-16da-908a-5bae-06b312aa1ec1@siemens.com>
Date: Thu, 5 Mar 2020 09:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPkDTbCy_BBCuvNsd8ZLAYtC=OAjY5E1mvqh-Sw==YS=m5TetQ@mail.gmail.com>
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

Hi Shiko,

On 04.03.20 09:49, ahmed El-Shreif wrote:
> Hi,
>=20
> my name is Ahmed. I am a Computer Engineering student from Egypt. I am=20
> really interested in contributing this year in GSoC program with Libvirt=
=20
> .=C2=A0 I was a GSoC student last year with LibreOffice. I was working in=
 a=20
> compiler project. I want this year to work in new project. I found your=
=20
> projects interesting for me.
>=20
>=20
> I have skills in c , c++ and python also I know Linux very well. I need=
=20
> to understand more. where to start or can you recommend some easy bugs=20
> to solve to get comfortable more with the code and to put goals of the=20
> "Libvirt driver for Jailhouse" project.

Thanks for your interest in this project! I'm adding the libvirt=20
community because implementation will happen in that context, and=20
libvirt would be the org to host this. Due to that, I would also suggest=20
that some starter tasklet would come from there.

To get familiar with Jailhouse and its current user interface, I suggest=20
to build yourself a demo image via=20
https://github.com/siemens/jailhouse-images and play with it. It comes=20
with virtual targets, so you do not need a specific hardware (though, if=20
you happen to have one of the preintegrated boards, that is also=20
recommended). Don't hesitate to ask here if you do not understand something=
.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/03946472-16da-908a-5bae-06b312aa1ec1%40siemens.com.
