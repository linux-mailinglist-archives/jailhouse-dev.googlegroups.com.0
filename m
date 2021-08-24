Return-Path: <jailhouse-dev+bncBC653PXTYYERBWFZSOEQMGQEWNURAFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFF3F5D4D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 13:49:46 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id u11-20020a0562141c0b00b0036201580785sf14583872qvc.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ozwm9RhXmPc1TOLaiNyO4L26cMBYnMeXHkzddorPm44=;
        b=Gg17wYDuzoP0deATvGGuATu2SJKK/nnZQWQemANLx8CqTqgc8OSJ7eOepI9uxWsdJO
         tBJbuyYf150/BWCBtFtfG1mzs3Eee4FYMYcoGnsbokLy50qxEDzvcM+6HJQptLwoCKWt
         iorNYC16u7HwaAzxdPwzP1PQ3pKQReawSgIZOQ4djGXUHY63ydqBAB4elB1Zdf/XOjAJ
         FXjdBMezPamMaeGeCrPnFA88yr1VXPZT4zAJbyd4Z4e8LZoJaskhEgm1wbktUDxpSM+M
         8KxTLeM4Hah3olX1jD/AgFdjXpID9vqJfUUT+Dwy71jP+helw5GGBP58ZgxIbZ4r60DJ
         CrZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ozwm9RhXmPc1TOLaiNyO4L26cMBYnMeXHkzddorPm44=;
        b=NdKmHAwNxCerPPaj3f/M4RP2sull9SIdLqRwpVBX1wh0k7P0vvJTLDmbjEhWPpyqAG
         1BdLiWk66IRhVWQny8ub249fybyUInn5qZQR5n0GbAWV/LsQVRdC1x2WP5urbolBPY5E
         cIA/BBtCJM8wnuTZQNmsowo7Kt3e8dBcsH1h99HjC1QDlqK0DcRZDN15OBUFD0N9z9Ld
         agt5jey0aKzd4nBGuDI95V6dp126DKC8vI+8UBpAZSi2dYp8tj9hdy++KIgR3pv4Ahfo
         lkae77OudA7KPz67xpuw/PkXs8gB4BIstne8HGa9fpuuqywXlTdFGUYEgPVw+U4+1sE3
         w2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ozwm9RhXmPc1TOLaiNyO4L26cMBYnMeXHkzddorPm44=;
        b=JEmWn61qJKzBLc6mzEgFx/kfNdk3XLkJKGZEOF3f5EcRF4RvNaYCYmmNJBYKtAyEiV
         gfqOxc0gkqG4ZJF7pjI3CURT/kepPcJ6AirjKETCllD7A2nZ0aHIFd9UVCGN3b3lXOPq
         a226uacBk+sJc/hoi39+2pw3fNn3uITMPkO6qlpFJpzSJjdd6cmQ8N90b89raiyEZGYc
         Zb0ATqOe3wwQ4SJYaUTZYht9dlG+6F9w+zqdCFH/Tf4x8kkI3oopzBm3f50pdYhg8BSD
         MCU0jxTorPV0JraaTUEN71W+FIJYH6RkMV8283vHsoyl0Nwi1ai4IQQ/mr8VfS/uX61Q
         PitA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53035ZzNXI1xowyKR/e6EONedK8p7zogz3OYTkJ/bkUGSy7wsJoM
	dKKUUSIViX8O8rKfj72XHYM=
X-Google-Smtp-Source: ABdhPJzWThB2UU73hVtVy6JDPXkH7h/5zSkRB5+7ymrAg39tQOGl5RCL2cGltLjZw/Xi4Pdnt9KrJw==
X-Received: by 2002:a05:620a:1435:: with SMTP id k21mr25951839qkj.442.1629805784697;
        Tue, 24 Aug 2021 04:49:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:50c6:: with SMTP id e6ls2025530qvq.2.gmail; Tue, 24 Aug
 2021 04:49:44 -0700 (PDT)
X-Received: by 2002:a0c:ab51:: with SMTP id i17mr10285639qvb.62.1629805784070;
        Tue, 24 Aug 2021 04:49:44 -0700 (PDT)
Date: Tue, 24 Aug 2021 04:49:43 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e81df823-0997-4dc4-85f7-8fb3632d9d57n@googlegroups.com>
In-Reply-To: <e69d0408-a3db-7f6f-75db-681719a44391@oth-regensburg.de>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
 <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
 <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
 <e69d0408-a3db-7f6f-75db-681719a44391@oth-regensburg.de>
Subject: Re: Building a Baremetal OS for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1842_773807630.1629805783626"
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

------=_Part_1842_773807630.1629805783626
Content-Type: multipart/alternative; 
	boundary="----=_Part_1843_138847049.1629805783626"

------=_Part_1843_138847049.1629805783626
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Please describe your *changes* of Jailhouse, attach a patch. Source=20
>code. I need to see your code in order to help you.=20
I am using jailhouse master branch. I edited rpi4-inmate-demo.c and added=
=20
GPIO memory. In the gic-demo.c I included a header file, otherwise the file=
=20
is the same as master branch. The header file has basic address definitions=
=20
and the following function in assembly. I tried also this function as a=20
separate file and the error is the same:


.global cpu_switch_to
cpu_switch_to:
    mov    r10, #THREAD_CPU_CONTEXT
    add    r8, r0, r10
    mov    r9, sp
    stp    r19, r20, [r8], #16        // store callee-saved registers
    stp    r21, r22, [r8], #16
    stp    r23, r24, [r8], #16
    stp    r25, r26, [r8], #16
    stp    r27, r28, [r8], #16
    stp    r29, r9, [r8], #16
    str    r30, [r8]
    add    r8, r1, r10
    ldp    r19, r20, [r8], #16        // restore callee-saved registers
    ldp    r21, r22, [r8], #16
    ldp    r23, r24, [r8], #16
    ldp    r25, r26, [r8], #16
    ldp    r27, r28, [r8], #16
    ldp    r29, r9, [r8], #16
    ldr    r30, [r8]
    mov    sp, r9
    ret

/home/pi/jailhouse/inmates/lib/include/OS.h:72:22: error: stray =E2=80=98#=
=E2=80=99 in=20
program
  ldp x27, x28, [x8], #16

and similar error for each command.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e81df823-0997-4dc4-85f7-8fb3632d9d57n%40googlegroups.com.

------=_Part_1843_138847049.1629805783626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&gt;Please describe your *changes* of Jailhouse, attach a patch. Source
<br>&gt;code. I need to see your code in order to help you.
<br>I am using jailhouse master branch. I edited rpi4-inmate-demo.c and add=
ed GPIO memory. In the gic-demo.c I included a header file, otherwise the f=
ile is the same as master branch. The header file has basic address definit=
ions and the following function in assembly. I tried also this function as =
a separate file and the error is the same:<br><br><br>.global cpu_switch_to=
<br>cpu_switch_to:<br>&nbsp;&nbsp; &nbsp;mov&nbsp;&nbsp;&nbsp; r10, #THREAD=
_CPU_CONTEXT<br>&nbsp;&nbsp; &nbsp;add&nbsp;&nbsp;&nbsp; r8, r0, r10<br>&nb=
sp;&nbsp; &nbsp;mov&nbsp;&nbsp;&nbsp; r9, sp<br>&nbsp;&nbsp; &nbsp;stp&nbsp=
;&nbsp;&nbsp; r19, r20, [r8], #16&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // s=
tore callee-saved registers<br>&nbsp;&nbsp; &nbsp;stp&nbsp;&nbsp;&nbsp; r21=
, r22, [r8], #16<br>&nbsp;&nbsp; &nbsp;stp&nbsp;&nbsp;&nbsp; r23, r24, [r8]=
, #16<br>&nbsp;&nbsp; &nbsp;stp&nbsp;&nbsp;&nbsp; r25, r26, [r8], #16<br>&n=
bsp;&nbsp; &nbsp;stp&nbsp;&nbsp;&nbsp; r27, r28, [r8], #16<br>&nbsp;&nbsp; =
&nbsp;stp&nbsp;&nbsp;&nbsp; r29, r9, [r8], #16<br>&nbsp;&nbsp; &nbsp;str&nb=
sp;&nbsp;&nbsp; r30, [r8]<br>&nbsp;&nbsp; &nbsp;add&nbsp;&nbsp;&nbsp; r8, r=
1, r10<br>&nbsp;&nbsp; &nbsp;ldp&nbsp;&nbsp;&nbsp; r19, r20, [r8], #16&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // restore callee-saved registers<br>&nbsp=
;&nbsp; &nbsp;ldp&nbsp;&nbsp;&nbsp; r21, r22, [r8], #16<br>&nbsp;&nbsp; &nb=
sp;ldp&nbsp;&nbsp;&nbsp; r23, r24, [r8], #16<br>&nbsp;&nbsp; &nbsp;ldp&nbsp=
;&nbsp;&nbsp; r25, r26, [r8], #16<br>&nbsp;&nbsp; &nbsp;ldp&nbsp;&nbsp;&nbs=
p; r27, r28, [r8], #16<br>&nbsp;&nbsp; &nbsp;ldp&nbsp;&nbsp;&nbsp; r29, r9,=
 [r8], #16<br>&nbsp;&nbsp; &nbsp;ldr&nbsp;&nbsp;&nbsp; r30, [r8]<br>&nbsp;&=
nbsp; &nbsp;mov&nbsp;&nbsp;&nbsp; sp, r9<br>&nbsp;&nbsp; &nbsp;ret<br><div>=
<br></div><div>/home/pi/jailhouse/inmates/lib/include/OS.h:72:22: error: st=
ray =E2=80=98#=E2=80=99 in program<br>&nbsp; ldp x27, x28, [x8], #16<br><br=
>and similar error for each command.<br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e81df823-0997-4dc4-85f7-8fb3632d9d57n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e81df823-0997-4dc4-85f7-8fb3632d9d57n%40googlegroups.co=
m</a>.<br />

------=_Part_1843_138847049.1629805783626--

------=_Part_1842_773807630.1629805783626--
