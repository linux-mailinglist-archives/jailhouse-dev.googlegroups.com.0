Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBF5HYHVAKGQE6JFZ3FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE04892EE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 19:42:48 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id e20sf20049629ljk.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 10:42:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565545368; cv=pass;
        d=google.com; s=arc-20160816;
        b=rYnVM2efoAvchcY+rMS7cYlThPGmr1l3iwtMveKn+gJUveC928jeWN3tq2QXTeXVlD
         JKAUguWQP2RBPEwwRlk4DYuNuyYkYiCqBDxmh9Nu/vNkZP67CG/AIZJm6rtFmjjMPzhQ
         qjQMb1AHP2pCDqYbFeeWH63std/sGAvLoFu5Qg6sQV10wz3BA0p36ZMjz7eRPLHdwHzK
         ozj7+FrhOlsgLtggWdr1X/VfnwYXlUOjXOq9HZwEKbDDGst5QOU0wIcKGj7vASuO1Wqg
         y/l+OgzrIIr8azyyaDNEKvjb/9NO/DGdt5Vm6lSZ3dmRsXcGEkLmmbDLve1gxXr9f8s1
         jovQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rVvNM56Gl2unsG6D7OyZGhmVLqbeKkwgbUbG1OHk1zs=;
        b=skHgLL+W0pVtoYrsSrfjBMATHRY/1oppkWaxIZ7zPcKKAYUejoiwGaQOehgqjgn7nw
         5OALpN//TR4qLV6ALbSZ3Huq1aVd825fwNjaXjI8dSMkMmhcdDtKQ/9J3JrqP943hSiL
         R/u6QT7HUdUlAYgEMnzTlK0i8/+u413q3JN+kcYkoKOx3kGnFN/x9BFD+24SOTfZPYsn
         M1HkkByG3Q+RApCjQ01VSOTDFFvQ7CSIJyob3NnLjSn/ppDppmnS1XoslL1tOmEoskRb
         mCopSJpVUcVXuTre82nbQEj+n+RDhVcJRl+aXiI3vBml0ApbFG+aRnHXv4tKO9eV5YK/
         aSkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cZ64O4Ut;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rVvNM56Gl2unsG6D7OyZGhmVLqbeKkwgbUbG1OHk1zs=;
        b=PlLcm3ovpQ2k7yOWu1K36Ua9S5Sdq4Nowc5lxQbOxGqF1eKFdPWfdoSVLa3sJPv5IR
         VlPjEg5CXe+A2S7C87e25dDxUr3U4nb/ut5oo7EySmxaPBFourYFG7yetm9F9E1ZOdsl
         /NN4pAavlFLH9QpEaTnO86EnSyS3n0VTD9tbYT4i+iuUW0BStpH/bL6XwtFqc4Y/6zX3
         FDjfNBU14mzbu/CpBlwlA1PxWrFkwYrrhENJTctHVumRkvBuKUaW1A3ipigeWNncj2oH
         SiPEaN+C4XdsPiep2HIZayxPHRixai9/QC3d5LdLRF+aDZMMqBnTMN3uuhSDxA30qD5H
         NIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rVvNM56Gl2unsG6D7OyZGhmVLqbeKkwgbUbG1OHk1zs=;
        b=E6ukami6tent34tI9HObrpJqNNK2NhiRy6dyyxUvOl95ASsKYsbWFqGbgWAgDAShb2
         q+6+v/yAeVKVofbg2sGnq4Ju3EPlqoD77nwsN4nxxYxpkxLaqUV0zv47FAm+XPriXWlB
         1h/WZKUoIIa4x+8Rgq3RiWlOZmYpY/zNgOFKaUeIDlhI21KmM5ZH7HmQicse8t6CEsDE
         qzccivYxw9XKAi0vPVV2lDSP9Eock+Mv4WyTx1o/aLG0ixAXVLQUqbsoEJGhiu7FYLv5
         lIJOvOr3y0LBjVQ0kHGSCdwB5+cI5GEGAqYaWTPaTkBZ6ZhISm+5GyYj8PokO360pa+v
         MoVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFsXd80dMXu2wkAh2W2SXWEG/jOTKu83yZMebLmCGbxuN6rBcC
	zo68TN3srs127XuLNTjfEO8=
X-Google-Smtp-Source: APXvYqxGnnqJPhryQIgeV6MD+38KGmq+ipf2l88cRCaFU5643jd0T+iO4GDgjsX2Ji7tpAMTsFVZIg==
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr17383728lfa.174.1565545368130;
        Sun, 11 Aug 2019 10:42:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:640f:: with SMTP id y15ls8716197lfb.14.gmail; Sun, 11
 Aug 2019 10:42:47 -0700 (PDT)
X-Received: by 2002:ac2:4824:: with SMTP id 4mr9313897lft.161.1565545367614;
        Sun, 11 Aug 2019 10:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565545367; cv=none;
        d=google.com; s=arc-20160816;
        b=x/7BOuvn9uLuLmZ0zBvun3El91JlSt3ehA8Cp+DM7B+ItqIPDOqMfZy12/rgACQmOO
         l3ml+1EvRrQEwvDsATwLGFC2ZndnhZm5LFi40jTBijTGXBBdkeiEpevYk5KEX+seMaBe
         l/aQkzZ3UDYwTm9gyaahP3P3QM0jQQE7/WsdsbGW3DqV+8MGIclLFi/bHTpUAQjkOeRt
         HvJQiMpoHLoGLFvlVsRn3r/FnqbVKH1K4leWrC0Vc/EMyzK0zMY+iAtq1A+EHlnDhnHK
         DliqPTjUGXa6r1hTnnqV6jUSss5DJGe70ahF3H4iQ5pzt7TsTzsvA2Vq4SheJnwmBclE
         RN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=inYaYjKUTComVgbwVLW2/Nr9PwkikJKePjpVRYhZzwE=;
        b=fNn21Qfn5qS4zmCq3kaQCQT/hEDDHP9uk1eTOK58Fm+tfsQWs5eCUhy2mzxFEfLc6U
         G7h5UDoYnb2T2SNLf0tvJgV4VB0GVhnP+0ugit6+9jTgLdnpS8YHmksgu9wpRDR49LNh
         sDO1iRoSk1QN6SFl73DGKb0Bmbh+LSf0+28VHRNUOt9UYi08bOPhLbUkiHuvDdddadk5
         QFinyD7pP2myolvKzNXhh7z+3pn8gw//3mkUG5mfIIM0WhYx2OU7Blqv2j2LhcbuLvz0
         pNQe5LxhHmFLQlCjNSQEiv2KdWvmW6HTKJJc+Dg63I/ZcfWJTizQTNiGi5WYaDi18Kw4
         DXTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cZ64O4Ut;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id q11si5443474ljg.2.2019.08.11.10.42.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 10:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MK24P-1hyFJD0wfl-001SCT; Sun, 11
 Aug 2019 19:42:46 +0200
Subject: Re: Problem with IVSHMEM on Bananapi
To: dianaramos007@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
 <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
 <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
 <7e6377fc-e8af-c947-8218-a435a065a597@siemens.com>
 <0a03b7bf-fcce-4de2-9a06-bb495cf47bb7@googlegroups.com>
 <a96c2d69-3449-b4e7-db1b-bf7a68708137@siemens.com>
 <23d3e368-b653-41e9-bafc-65fe0d6a2eb4@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5323df1d-ebce-eb6c-dab2-6a1f43038cc2@web.de>
Date: Sun, 11 Aug 2019 19:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23d3e368-b653-41e9-bafc-65fe0d6a2eb4@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YZi9D5+cgEuSWAdGN6Mc8rXw9YGqXaohU3jlQmwjkqwkSMN7ZzS
 KmQWEURLV84dO2+XuCzaD7De4vby/KdXXdLXmW2ikEr0LPSfAuHnUoDqjSWUS6vn8cgUtO3
 IcBUwfLDNWuV2CBPcVCNfy5AtPNZVAqe9eLYWGRMVTzJ7xbriR2h0jZ0CUjzO/OvdOIChYe
 kmdtBUl4D/rYRENacfHmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5MS65Vg1c4s=:d06hMia+H0+HbDcmEqyImc
 PmoHYgfMfDwLsYp+DGq73Bqhz4yhgEYe7u2Mxx9dk2g08LT9PQFDnw+5dGrZsFH8DQ4FLUivb
 +CigvHM9odEMevYrPRr9fmEnJfSF8y84l3rfal+MhJleWrkaelZYRe5QJeMquNqVkRGz8a/Uv
 OSSzdDecUOhqrIWD8kbzUA8holxYiFD3DwR+buMYveB2pIr+oMFMwT5Cca0ARZKzN+1tpEbR1
 hWFumQoOcsC/Ac8icKXivWtHc+tF/th0ytIbEdWcbP3mVPBSKBdL2Lqss4tjZRtV+2WNNtEhE
 aqLKQMQFOPrlMftobL0413nRzC6yQeSL/GngQfVLlXq2KBvpR+1SlYgI+KJdgRDjkJduSm62Z
 ANb0+NCw9Q3pFoxSCxdQhbPQYrAtXw6GQ4b9+Na00EdEF3n3J/lMIlhP96pR/O5YgitgOFbeg
 xGjZ8JSMY1dQCBIlmLTi8yI08GDTitYRF4pXVjV2TR3AsSx/yQ1tSyJSncvt5x8JcGQA4rju4
 uGelCtMWD/ISp3lrfLULyBj/XGuqnYyEyPiBQXeELMMUh6yT2EoUtseDCk797piezJjH3dKjG
 CR7T+mk9eEeHRhyYAWwCnntrs+Om5GcL0pO4zGV2vPQNLRSUkvtd3V23qNylBYrCAJ0SeVU9+
 BAI+bDpVKNPU+6R1IDlt8e5sTEWsS0VgYBzmqNxbGOnqjUvHTBi4KaYj/JMuwMuQPDz322/RN
 M7LsVROYEoHo1CemekcswaUvwYEpGHzZ89+HBuqrzOVq3KcEr5TOFi1EYHDonkdiDVChaMC34
 6gbXvQyayKfGTaclJC9cLjpXhBO6LFjSAYXrNI42wYiHs5m1OewfVac67bXpF0fDtMEHLsRuJ
 PBF/RjmIzToP96UAPRZFYC7PmkM7UNu0FPt8m31W62AxAUoF7L0aXXRtRlSsXsI1fvIi0Tlsg
 n59zTY7sThcrHB2nU6o/ddpejzleOnKOrRycNphEluTCSz4AyqiEK1heFxFTPyHQKr/8a4dVm
 qCHQ8fiMwGlGClpoNWI/cdRtYFuZRNsaXW8tSBA07jl25Ir75X680qGF2BmG/Io4NDyDjhxmM
 dCDNW7WEZ7nhqV1TVgCDPUGjEFiP+gr6JeHv1iiS1DiGfA2+ZmdhmxivF3FK8eLYKBLnC8eGn
 LynVw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cZ64O4Ut;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 07.08.19 13:14, dianaramos007@gmail.com wrote:
>     Loadable does not imply that the root cell will get access to that re=
gion
>     automatically. You also need a memory region in the root cell that co=
vers this
>     area. Access to the overlap will be controlled by the hypervisor safe=
ly,
>     i.e. it
>     will be taken from the root cell once the non-root cell starts to run=
.
>
>
> It makes sense. I no longer have those unhandled traps related to RAM.
>
> Now I'm having the follwing:
>
> Unhandled data read at 0x1c2006c(4)

And which cell is triggering that?
(I think we need to reformat this line - everyone cuts of the originating c=
ell...)

> (...)
>
> The debug console for bananapi is set like:
>
> .debug_console =3D {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .address =3D 0x=
01c28000,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x100=
0,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0//.clock_=
reg =3D 0x01c2006c,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0//.gate_n=
r =3D 16
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0//.divide=
r =3D 0x0d,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .type =3D JAILH=
OUSE_CON_TYPE_8250,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_CON_ACCESS_MMIO |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0JAILHOUSE_CON_REGDIST_4,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>
> And for bananapi-gic-demo:
>
> .console =3D {
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .address =3D 0x=
01c29c00,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .clock_reg =3D =
0x01c2006c,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .gate_nr =3D 23=
,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .divider =3D 0x=
0d,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .type =3D JAILH=
OUSE_CON_TYPE_8250,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAIL=
HOUSE_CON_ACCESS_MMIO |
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0JAILHOUSE_CON_REGDIST_4,
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>
> By the output and both configuration files, I suppose that that clock_reg=
 from
> bananapi-gic-demo is triggering the trap. Can you please explain how this=
 works
> and how I can manage to fix the situation?

If that register shall be accessed by the inmate (required if Linux turns /
leaves off the UART), you need to grant access. Granularity of that access
permission can be 4 bytes here (single 32-bit register) - provided Linux wo=
n't
touch the same one after Jailhouse started. Again, make sure to organize th=
e
root cell config already in accordingly sized memory regions so that they c=
an be
taken away without breaking up an existing one.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5323df1d-ebce-eb6c-dab2-6a1f43038cc2%40web.de.
