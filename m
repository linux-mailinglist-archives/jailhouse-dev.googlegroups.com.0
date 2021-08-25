Return-Path: <jailhouse-dev+bncBC653PXTYYERBG5ATGEQMGQEG3DVT2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id C77953F76F3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 16:13:48 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id o4-20020ae9f504000000b003d39d97b227sf16824651qkg.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F5pigIV3YghidlxS0VbrqezsAsVaSPT+jJVyjpzeKp4=;
        b=UdZ9SD+ekT3ogezjhwiMNr7YdRmwGIHC72aMPAgoJx8rENAC9LtrGxfYw35rQF2ja5
         7x8KPmCe0c86N1cal696z0I/zc/R3v62671HpfS9HiZj8wwEo+RVphihVD5pdtt1OWvJ
         1zsYOb5eTpygdJ5pbggFtWvlwBkSahdGuh5RdMWc8WQIkt3y7PP0OPZDeATsNA7bLHJn
         y5KdNrO/yhaRRlhLyUXnNZPfYfGBC1W1qCyGO9fHpB/h9jl2ovntY2zJ87rFP6rt3jp+
         dWA4SeZ9DGNiyZwX7808evDG6szsLw+rTd4oB4OS3FvFXCmld8TeCxo7zNzJnsCaGau2
         /w0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F5pigIV3YghidlxS0VbrqezsAsVaSPT+jJVyjpzeKp4=;
        b=DXGOsTt0oghJTIWUvEHE3i7WVBdhfUUsHIU2GRmUDyhp7QxcyU2H0Gdwo8FjBgTGrB
         SARagvB9CQrue7H7u//sRD+LY8odjC9tpAAxMWzvKxfktOZTVjlAksP3ku487BBtWD7s
         3WPVwM94qQDZ1uRKQ3RBK00OE6IQoFhuqZv+WGEVOcda3stQOF+JSLvpQVOPZkAfzvSF
         /5tRX+eT4NBMq3QquLte8HVBQgHvMfBrZRUWj0ppIKJ2UJnUQrgs2a95L49nZ67M2oWv
         4CFh1lm65MCVGbdsZzWyFQg6LNmTevNxcEv+jWDszJafnTJOcjdLWVMcZjPL7rhfomIe
         yuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F5pigIV3YghidlxS0VbrqezsAsVaSPT+jJVyjpzeKp4=;
        b=fd05+LqQULfieDMIMsZB0KsKZ6xoso/fbM2oEdyb5+8b22X4m7JEOWlZ8nW/lVjri8
         AQywRiGAmW3+lSu9kP4RJYLjp5n8Uv0gkyU72okGeuzLaOcpbiS8pPP3MQkhT62Y0GSy
         8WsafZ7Cf67G+aeg/24sdo6ERNh0Nv9GA283VW8bLLsI5LdaT4RE4KovkIUKfTcLRXs0
         BIxOqdg5Vo08td9SoMR4RERzFr0b/AA2Ont+l3ty26ZMpV5cKTzGSRMzZndjb2kyRX7Q
         23ymia+BkOAMdF203mU3lRrf6N6HicnznbVp6s2h7rDuFigifmoLKoGHHdfZnjLDqgox
         KFjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532G4Dwt+nsarmYLe5qsgehiKny3/KRpJHNIETq9na+QJ1A2ez5+
	Gm7iplJaeT7bHKBF96m/5So=
X-Google-Smtp-Source: ABdhPJxKQQ0eOtmq+4jWSAyLhCKYHQKyAk0VSjcAbK0qRSse+7uRSQO/VFczMyFG+LHLOXdTzfs6eg==
X-Received: by 2002:a37:a78f:: with SMTP id q137mr31433636qke.289.1629900827883;
        Wed, 25 Aug 2021 07:13:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:298b:: with SMTP id r11ls1242190qkp.5.gmail; Wed,
 25 Aug 2021 07:13:47 -0700 (PDT)
X-Received: by 2002:a37:a212:: with SMTP id l18mr23209219qke.115.1629900827135;
        Wed, 25 Aug 2021 07:13:47 -0700 (PDT)
Date: Wed, 25 Aug 2021 07:13:46 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bd489367-cb13-4b27-a8b6-84df5bd8c675n@googlegroups.com>
In-Reply-To: <52eaa77d-6f8a-ff52-2ac2-cebdad3298a8@oth-regensburg.de>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
 <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
 <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
 <e69d0408-a3db-7f6f-75db-681719a44391@oth-regensburg.de>
 <e81df823-0997-4dc4-85f7-8fb3632d9d57n@googlegroups.com>
 <185ddd7b-09f2-422f-ab16-309ab34c0ee1n@googlegroups.com>
 <52eaa77d-6f8a-ff52-2ac2-cebdad3298a8@oth-regensburg.de>
Subject: Re: Building a Baremetal OS for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1622_2010350951.1629900826451"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_1622_2010350951.1629900826451
Content-Type: multipart/alternative; 
	boundary="----=_Part_1623_1875373585.1629900826451"

------=_Part_1623_1875373585.1629900826451
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>There's a .tar.xz inside the git repository. Unzipping it gives me a=E2=80=
=A6=20
>dirty Jailhouse git repository(??).=20

Sorry for inconvenience and I will try to do what you said.=20

>Anyway, I had a look at it. AFAICT, everything compiles fine. The file=20
>you referenced to was probably inmates/lib/arm64/OS_Scheduler.S, right?=20
>This assembler source isn't referenced in any Makefile, so I don't know=20
>what to do with it.=20

Yes, exactly. But if I included it I will it will return an error:
/home/pi/jailhouse/inmates/lib/include/SCHED.S:12:22: error: stray =E2=80=
=98#=E2=80=99 in=20
program
  ldp x21, x22, [x8], #16

The error does not recognize=20
I included also asm-defines.h in the assembly file.
#include=20
</home/pi/jailhouse/hypervisor/arch/arm64/include/generated/asm/asm-defines=
.h>

So, I will try to make it easier for you to understand:
- Which library shall I include, if I want to add assembly code to=20
gic-demo? (Context switching code)
- Shall I write a .S file and Include it in my header file? or add an=20
assembly function in my header file? using flag __asm for instance?
- If the second option is possible,  then what is the correct flag that=20
jailhouse uses?=20
I tried with Cortex-M processor and that was working, but I think it may be=
=20
different here for some reason.

Thanks in advance,=20
Moustafa Noufale

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bd489367-cb13-4b27-a8b6-84df5bd8c675n%40googlegroups.com.

------=_Part_1623_1875373585.1629900826451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&gt;There's a .tar.xz inside the git repository. Unzipping it gives me a=E2=
=80=A6
<br>&gt;dirty Jailhouse git repository(??).
<br><div><br></div><div>Sorry for inconvenience and I will try to do what y=
ou said. <br></div><div><br></div><div>&gt;Anyway, I had a look at it. AFAI=
CT, everything compiles fine. The file
<br>&gt;you referenced to was probably inmates/lib/arm64/OS_Scheduler.S, ri=
ght?
<br></div><div>&gt;This assembler source isn't referenced in any Makefile, =
so I don't know
<br>&gt;what to do with it.
<br><br>Yes, exactly. But if I included it I will it will return an error:<=
br>/home/pi/jailhouse/inmates/lib/include/SCHED.S:12:22: error: stray =E2=
=80=98#=E2=80=99 in program<br>&nbsp; ldp x21, x22, [x8], #16</div><div><br=
></div><div>The error does not recognize <br>I included also asm-defines.h =
in the assembly file.<br>#include &lt;/home/pi/jailhouse/hypervisor/arch/ar=
m64/include/generated/asm/asm-defines.h&gt;<br><br>So, I will try to make i=
t easier for you to understand:<br>- Which library shall I include, if I wa=
nt to add assembly code to gic-demo? (Context switching code)</div><div>- S=
hall I write a .S file and Include it in my header file? or add an assembly=
 function in my header file? using flag __asm for instance?</div><div>- If =
the second option is possible,&nbsp; then what is the correct flag that jai=
lhouse uses? <br>I tried with Cortex-M processor and that was working, but =
I think it may be different here for some reason.<br><br>Thanks in advance,=
 <br>Moustafa Noufale<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bd489367-cb13-4b27-a8b6-84df5bd8c675n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bd489367-cb13-4b27-a8b6-84df5bd8c675n%40googlegroups.co=
m</a>.<br />

------=_Part_1623_1875373585.1629900826451--

------=_Part_1622_2010350951.1629900826451--
