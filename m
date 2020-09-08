Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBMM33X5AKGQEIEW3DJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93D260E95
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 11:24:02 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id bo17sf8822414qvb.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b/qDVN/LO0wcbXc7WODJx3KAZPZMm64TMautzqKyisE=;
        b=IIBpiLQnBF6vhyaBDKf16mHLc/yJY1g9K2fKkVy7gnKUtLnt5G5X07NzazLn8Yi21Z
         pD8/QC1VmPqCtklFZwBgBfuSlVGaiA01Cdy3gGQ3bGfMq9gXMrZgTnm57ls0LWihNSHB
         jlfDFt/UC+3U7dE+EOxigNJ1ybnX6WVHlYomfYe54UvNroop7+ctkCCSdh50BbuOxKtZ
         h3DzrWgqvXcDoZmOhCvVWOZij4ZziykP6/qHmYrWTyWA0VOUApl1YVaX/Kpb6LuFQuWE
         8zwUOtaMPQzxEanLNa0ChB8zTxsTVToHOPH25Dbxug6vO7eS1do2jx8QEQbfGUsWWTSo
         VPjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b/qDVN/LO0wcbXc7WODJx3KAZPZMm64TMautzqKyisE=;
        b=An9HvFDElkhwFFBSMTrwjadwBDF4ZGiHZQRzPCE/euiz2hBRqG0oisBk8fYVRzvQ3r
         6B1A6Lk1wJ6oE56DNyrT/VgDVFb4HI920d7AOC+lgLQJn+Nvh5n+t5cJVkE98XJUrhe8
         gdduXdiFuzwWa7SwESBb+gmuVXjuxtfSUFMyzPrSC51W1xe77JamIbNUP/LMteAU958H
         /4qm5Ba5V3JFM8OsjU1wAwXIz3n/Nr51riVWaJ8NdgZZGf0yDz29YOEDcusiau4J2Obl
         25lTbXPUO9slPsB0T0RCgJvrjBFqLRgmgEOhP+XoSkrwr0JomMXcuUZ4C8+saBC3TMbS
         H6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=b/qDVN/LO0wcbXc7WODJx3KAZPZMm64TMautzqKyisE=;
        b=Q+HIrjXZQAuQuJ27f9p2i/Y5mjq5Nik9clxZ3RUsveAru1lzWhB2OxIA+rYdtmwUW+
         ieY/Fs1NI3M733HHcEmWLt2HhUHLZMQLYNmxApjFPU/nd8w0+IhCBtdJFOu5s+Vnsq9j
         JkdNxd2g84L8/2YgjeLt880bEzsn1nlAkq+M8OL3NbDMqTs5x9bAa8U/27xcydhCaHEb
         0BwigdHNWRobZujZKWdaWxI/00ZRIcFgg4j94JDNsdt2jOkTNWhevciCki45g2WMgW9k
         HeWMSEAE7azpMqEice1QBboDgTzxPkV/EqjkxTTZWN0SfDjPl81LzPwbjJK+tZ+oe0cw
         IcWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vRitu4Ahie/I2C10+ZT0x3t+ALdHu9+4R54gHUapXuFqLORbY
	fZTEnUZk1V/mu+//Wq0k27c=
X-Google-Smtp-Source: ABdhPJztcf0Ado9dvBuZ3sTscHrVCD9RCEFbWa7YMzblKggHvwLY27/UuNkGGD7ny3R763QBtHFjxQ==
X-Received: by 2002:a0c:ba8e:: with SMTP id x14mr23901388qvf.23.1599557041634;
        Tue, 08 Sep 2020 02:24:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:f303:: with SMTP id p3ls2836219qkg.10.gmail; Tue, 08 Sep
 2020 02:24:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1104:: with SMTP id o4mr4462463qkk.462.1599557041018;
        Tue, 08 Sep 2020 02:24:01 -0700 (PDT)
Date: Tue, 8 Sep 2020 02:24:00 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d4bddad4-98ed-48f3-b670-f114d42fdf4bn@googlegroups.com>
In-Reply-To: <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1390_972433640.1599557040221"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_1390_972433640.1599557040221
Content-Type: multipart/alternative; 
	boundary="----=_Part_1391_457087083.1599557040221"

------=_Part_1391_457087083.1599557040221
Content-Type: text/plain; charset="UTF-8"

Thanks for the hint!
How do you know if you aren't the inventor of the hypervisor?
So it is extremely difficult to use jailhouse!

Just for clarification:
Is the Linux kernel for the root cell always started with "intel_iommu = 
on" and the kernel for the guest cells always with "intel_iommu = off"?
Or is the linux kernel always started for both the root and the guest cells 
with "intel_iommu = off" and only for the creation of the configuration of 
the root cell exceptionally with "intel_iommu = on"?

In the meantime I restarted the linux kernel with "intel_iommu = on".
However, I still get the same error message when creating the configuration 
for the root cell!

Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d4bddad4-98ed-48f3-b670-f114d42fdf4bn%40googlegroups.com.

------=_Part_1391_457087083.1599557040221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the hint!<br>How do you know if you aren't the inventor of the h=
ypervisor?<br>So it is extremely difficult to use jailhouse!<br><br>Just fo=
r clarification:<br>Is the Linux kernel for the root cell always started wi=
th "intel_iommu =3D on" and the kernel for the guest cells always with "int=
el_iommu =3D off"?<br>Or is the linux kernel always started for both the ro=
ot and the guest cells with "intel_iommu =3D off" and only for the creation=
 of the configuration of the root cell exceptionally with "intel_iommu =3D =
on"?<br><br>In the meantime I restarted the linux kernel with "intel_iommu =
=3D on".<br>However, I still get the same error message when creating the c=
onfiguration for the root cell!<br><br><div>Jan.</div><div></div><br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d4bddad4-98ed-48f3-b670-f114d42fdf4bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d4bddad4-98ed-48f3-b670-f114d42fdf4bn%40googlegroups.co=
m</a>.<br />

------=_Part_1391_457087083.1599557040221--

------=_Part_1390_972433640.1599557040221--
