Return-Path: <jailhouse-dev+bncBCH5DAO5VMDRBNXD5GJQMGQEYYEO7BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 2015D521B54
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 May 2022 16:07:52 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id q5-20020a05620a0d8500b004738c1b48besf10774254qkl.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 May 2022 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IYMku5IzmgB7qiWXA90+47cX1zUFyKntXaKrcxH042c=;
        b=eG6vG4xlqomOm9KWekOUHBDsMXQ7RT5H9vi5z2torAYwDeqgaEbmRhBAIyStZlMxZ9
         J9PW34Y72uVYba6I+M9bG5B8HgPagKaKK24/RrWdC8dAe+3vt+mMfg9E0KnLtUgeYTb+
         HRT1CqJ8+4fLVgAIeC+zjOkkJXzCI4qCWAufMANeae0RWFa9dwbf0FpqI3Y+pj20QLMO
         S2WwUsVhPrf9UAqJQw7u+GpwWcY2ZlM5DUXBQ7oRoFbee35KvLgdwi4zBZGI+CTAfnOJ
         khwYPeyZCrdRcCLKbeBKjJoHFmbnSKg62ex7eDAAO1FM5VvGeiPN5tNvY0CIVfFtNCqA
         ElCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IYMku5IzmgB7qiWXA90+47cX1zUFyKntXaKrcxH042c=;
        b=K0SkN7Uc/7Hozx5Uyrw2I5nXJBuc2/KLg+br/droUzkB82NfOuLvm5n/gcxPY2dCVZ
         eVNqh8ZqHlGOgd203ApRG2TSuWEmmmmIO+6l5VUArkYoRaFjixJzFtElYCCbNICaCyLz
         F0VPlKk66rSwhukMv0pe+7piLmYdMm6OPT0nX3l5QT3OgQf5wR3wrs0LXHyt1OjkxN6n
         GlEie7iV7xOs5NzMRL3DBW6YOPkpwsJ/L8udRAqnsHudAypO962fovKmn8wKKmAaD+2g
         zOGOW2DdgXmwIosuJna0hXja3qSl9uhWeLHIzgbDg+DpMTI4bqRwCR+GuB0RkgyyGY85
         HWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IYMku5IzmgB7qiWXA90+47cX1zUFyKntXaKrcxH042c=;
        b=ZCCdwDuE1K+Aw1/wwR9eL2cLHkFUuoU7zVU8quMxlERmixHKPlQu88Kmyw+7ZFRm2S
         9AIilk5uI16eWCK2EUv6+puyCXkfDM9rMnILf8f8hqCmiw2tg7n2dniLvHND4Gqya0rp
         Bi2Gb605E+zE7AoDAWTddNwJkjr5eSlPfAvQgnxvf1VJl54SwLKMD3pVefgJ+MsWkSQY
         zQPB/vlUTgdkuk22HcuqeoV3ASZ2Llv7uAr2sjyXnits/P4SCw2ZFUkQvvBBbfIBZCJv
         XnOCmLr7Rpe3mowb7W8RtjSH/APttTXbaNRsmykWwJxwoDvYNL0aLYh0YfwBmIkrGry7
         yPUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tutKlJbZPyiA8xxPTRrhh+7YgX/D3Yc+TAKoTvlzvZNGw1nKo
	mF8pCrqD2RUo2/AhjOEK4X4=
X-Google-Smtp-Source: ABdhPJz+qsT+VsgREmYTIJK6ZCD+hwrOug+LovIJ4VUjswyAZkiEckVmP53063dQpkmEbvV1/BIX+w==
X-Received: by 2002:a05:620a:4256:b0:67e:87a1:ffdd with SMTP id w22-20020a05620a425600b0067e87a1ffddmr15242175qko.647.1652191671005;
        Tue, 10 May 2022 07:07:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1e12:b0:2f3:d3ff:490a with SMTP id
 br18-20020a05622a1e1200b002f3d3ff490als4874101qtb.2.gmail; Tue, 10 May 2022
 07:07:50 -0700 (PDT)
X-Received: by 2002:a05:622a:11c1:b0:2f3:c0d2:225d with SMTP id n1-20020a05622a11c100b002f3c0d2225dmr19365669qtk.296.1652191670045;
        Tue, 10 May 2022 07:07:50 -0700 (PDT)
Date: Tue, 10 May 2022 07:07:49 -0700 (PDT)
From: Daniele Ottaviano <danieleottaviano97@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9baeea16-0fdd-4be9-a227-ff94d1ae5e82n@googlegroups.com>
Subject: Jailhouse over ZCU-104
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_892_31922413.1652191669512"
X-Original-Sender: Danieleottaviano97@gmail.com
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

------=_Part_892_31922413.1652191669512
Content-Type: multipart/alternative; 
	boundary="----=_Part_893_1609116819.1652191669513"

------=_Part_893_1609116819.1652191669513
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm trying to run Jailhouse over Zynq Ultrascale+ ZCU104. I have found a 
guide showing the setup for ZCU102 but it doesn't work for me: 
https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md 

First I tried to compile jailhouse on a build created with petalinux 2022 
but it fails. 
So I decided to use the old release of petalinux 2019.1 because it works 
according to this guide:
https://www.erika-enterprise.com/wiki/index.php/Xilinx_ZCU102#Setup_of_the_GNU_Compiler_for_aarch64.

In this case, I'm able to compile Jailhouse but when I start the board the 
process stops at boot time.

Has anyone successfully ported Jailhouse to zcu104 yet?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9baeea16-0fdd-4be9-a227-ff94d1ae5e82n%40googlegroups.com.

------=_Part_893_1609116819.1652191669513
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>I'm trying to run Jailhouse over Zynq Ultrascale+ ZCU104. I have fo=
und a guide showing the setup for ZCU102 but it doesn't work for me: https:=
//github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zc=
u102.md&nbsp;</div><div><br></div><div>First I tried to compile jailhouse o=
n a build created with petalinux 2022 but it fails.&nbsp;</div><div>So I de=
cided to use the old release of petalinux 2019.1 because it works according=
 to this guide:</div><div>https://www.erika-enterprise.com/wiki/index.php/X=
ilinx_ZCU102#Setup_of_the_GNU_Compiler_for_aarch64.</div><div><br></div><di=
v>In this case, I'm able to compile Jailhouse but when I start the board th=
e process stops at boot time.</div><div><br></div><div>Has anyone successfu=
lly ported Jailhouse to zcu104 yet?</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9baeea16-0fdd-4be9-a227-ff94d1ae5e82n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9baeea16-0fdd-4be9-a227-ff94d1ae5e82n%40googlegroups.co=
m</a>.<br />

------=_Part_893_1609116819.1652191669513--

------=_Part_892_31922413.1652191669512--
