Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB3PFSOZQMGQE67DXVQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD590140C
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2024 02:10:24 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-df78fddad5dsf6340027276.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 08 Jun 2024 17:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717891823; x=1718496623; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzkT9LlQ4kUP/FOa5wXwXdfNjmwmlXKQGiLx4ralih0=;
        b=hN+EOtxHi8SyyNVSY9oHCnL3sdboqTaAaPH+GrltKJc+ZnXDCnz3+zrv9xJGhfqcta
         0z4yBSReAJnKxLUguZIyRmzqIHwKzeL41of2m6nAXUurxyc8fwBLouDeS8BDZqwD2r/M
         Jzr2h1rF+H0wMTi/6ODo6gkOuui7Rec9JrMbUFZfuT4cwKPmY42zXPVnj7yD0ikaa4FM
         iclQjWjMPYd0AdEooQO9oZZy6aLZR5PZgsrRRKaGkRkkMUQF8czkNtaOppLhBPzc/qED
         CvmcuwTmQUkrsJLZAg5SyT0hUrTZLAWkqmv9FeoIZE3I5fMb51LYNQ0ATcI2e1orr+iF
         aSzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717891823; x=1718496623; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzkT9LlQ4kUP/FOa5wXwXdfNjmwmlXKQGiLx4ralih0=;
        b=I5uMuYdZZzb8EjNJxfRg/apKGyFvhOpymlAHofddsAdg2VYLlModFbpxL82bFPF/11
         GS6qmjgjIAuEs7WsNJthabCJk6UBrmsWjIEuT62+W2hpoZpogE2ooLxHhzoVhZ64s4UD
         tl64YMqqnU79GM+JT48sGyDS2kayv4TlGLNevH41G1y4dfN9hYJ+jZ8I3ygqTtNCOkWz
         LUANQjfYQKQTHOoZHUEkOun4ptqklWgmvnUuFBo6NXUOpvcSC2tp4loIB4Se5npocVyP
         sIXwELsMRbZuN/muu5NVWVTxnAyuftvToLk1PuFFiyPp+ARqVLBHoNRpPkbWPNo20PRf
         iW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717891823; x=1718496623;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzkT9LlQ4kUP/FOa5wXwXdfNjmwmlXKQGiLx4ralih0=;
        b=n9/D6To4CAicQF60XjNAr8Wj9VbS/m6hMSM4tfXY/uSaCmFbCpEOPoNUoI3l3P4i/p
         vC+ZcQ5P5nC5SAWUpk/1Ogsk/N3H8JCN1TWHjoN/h6Sa848uTPGPZod7U7O34jFWeADT
         OTr2ZhYOO5zgipcFmx3UxE6n9EH/Y3kG8xqnWR9vnqBgsC+OYrdf014RdAH54ZPU34zt
         z++6TY06xOmw2m4zzdhyZVwrcFQNaiZoSNSeHrtusSqZkngNx3zW8W4neLsCIugt1ZOV
         8Rs6e9WoKum0ewA95PBu4kVaAcKYjsDj+dzM8BybILXQfDhojnO7DZj56elyi1gf9LFD
         KWxQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWniTBfrHkCe6185lYdIgIy510c574W9y8rh8TRIz8UgaDHuOgd8DnrgBfe8B3H53vg28fkegQfCPRCEEAipCvVCxyDDeT+/uNlYf4=
X-Gm-Message-State: AOJu0YwX4FoPoER6e79Jo654PzjrFuGlYd3/gcSLPP7ds3Yx+SYE68D8
	2p0XTGQYNcskCjnOOeDu7z+/yuLW6EfdH3sms13JPB3u6YOcs1DJ
X-Google-Smtp-Source: AGHT+IFVi1NTgWMxBXC9sDM3o0h4fThRil7tWm0Esp0jgOoTKSMSA7Q37bOzA345/wZO3+/AtKYSxQ==
X-Received: by 2002:a25:8205:0:b0:dfb:3bc:ba57 with SMTP id 3f1490d57ef6-dfb03bcdfb8mr3970093276.64.1717891822790;
        Sat, 08 Jun 2024 17:10:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:fc09:0:b0:dfa:77ba:dc1f with SMTP id 3f1490d57ef6-dfaf162a805ls2947247276.2.-pod-prod-06-us;
 Sat, 08 Jun 2024 17:10:21 -0700 (PDT)
X-Received: by 2002:a05:690c:f95:b0:62c:f01d:3470 with SMTP id 00721157ae682-62cf01d37a0mr9118997b3.6.1717891821097;
        Sat, 08 Jun 2024 17:10:21 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:10:19 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cfa7782b-6db4-4434-9d24-aadbee870488n@googlegroups.com>
In-Reply-To: <59e205f7-8706-442a-a5ba-65dba773eabfn@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
 <b233e3c5-c126-4ff1-a109-8d2862e939ee@googlegroups.com>
 <aa79214c-06f5-482d-9b3a-18cdfd9a1909n@googlegroups.com>
 <5ac62ff7-670a-40a2-9271-700b1f8d7f86n@googlegroups.com>
 <59e205f7-8706-442a-a5ba-65dba773eabfn@googlegroups.com>
Subject: Re: jailhouse + ZCU102 V1.0 + second UART problem + petalinux
 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_258990_423569019.1717891819895"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_258990_423569019.1717891819895
Content-Type: multipart/alternative; 
	boundary="----=_Part_258991_713131651.1717891819895"

------=_Part_258991_713131651.1717891819895
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics
Penis Envy magic mushrooms are three times more potent than other=20
mushrooms. The effects of Penis Envy magic mushrooms may come on quickly=20
due to higher levels of psilocin than psilocybin.
About Penis Envy
Penis Envy magic mushrooms can impact you differently based upon a variety=
=20
of factors, like your size, weight, your state of health, whether you have=
=20
taken them before, the amount you take, and more. The setting in which you=
=20
are taking them and who you are with are critical factors. Being in nature,=
=20
in a safe, calm and tranquil setting, with no pending pressures or=20
obligations is ideal for the user.=20

Trip Level 0: Microdosing
Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micro-=
dose is a=20
sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=20
creativity or feel less anxious. Microdosing trip levels capsules. Added as=
=20
level 0, it=E2=80=99s meant to be taken along with your day-to-day routine.
Trip Level 1: Happy go lucky
Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effect=
s are mild and=20
similar to being high on weed. Music starts to feel better, strangers seem=
=20
more friendly and the mind is able to lose some control. You could have=20
mild visual enhancements or some sound distortion, but these will be subtle=
.
Trip Level 2: Beginner=E2=80=99s paradise
Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consistent=
 sensorial=20
accentuation, colors becoming brighter and a light body high. Level 2 can=
=20
be a more intense form of Trip Level 1, but with the right dosage it can be=
=20
something more. Be prepared for the beginnings of visual and auditory=20
hallucinations: objects moving and coming to life along with geometrical=20
forms when you close your eyes. It will be harder to concentrate and=20
communicate and you will notice an increase in creativity along with an=20
enhanced sensation, lightness and euphoria.
Trip Level 3: Classic psychedelic trip
Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Level=
 3 is great for=20
beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic experi=
ence, without=20
overdoing the dosage. This level is where visual hallucinations along with=
=20
the appearance of patterns and fractals will be evident. No more hinting or=
=20
subtle flashes of visuals, it=E2=80=99s happening for real. The surface of =
the=20
object you=E2=80=99re observing will become shiny and moving, as your field=
 of=20
depth is altered. Distortions in the aptitude to measure the passage of=20
time, might cause an 1 hour to feel like an eternity.
Level 4: Flying with the stars https:
https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics
On Monday, June 3, 2024 at 4:10:23=E2=80=AFAM UTC+1 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
>
> Penis Envy magic mushrooms are three times more potent than other=20
> mushrooms. The effects of Penis Envy magic mushrooms may come on quickly=
=20
> due to higher levels of psilocin than psilocybin.
> About Penis Envy
> Penis Envy magic mushrooms can impact you differently based upon a variet=
y=20
> of factors, like your size, weight, your state of health, whether you hav=
e=20
> taken them before, the amount you take, and more. The setting in which yo=
u=20
> are taking them and who you are with are critical factors. Being in natur=
e,=20
> in a safe, calm and tranquil setting, with no pending pressures or=20
> obligations is ideal for the user.=20
>
> Trip Level 0: Microdosing
> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micr=
o-dose is a=20
> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=20
> creativity or feel less anxious. Microdosing trip levels capsules. Added =
as=20
> level 0, it=E2=80=99s meant to be taken along with your day-to-day routin=
e.
> Trip Level 1: Happy go lucky
> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effe=
cts are mild and=20
> similar to being high on weed. Music starts to feel better, strangers see=
m=20
> more friendly and the mind is able to lose some control. You could have=
=20
> mild visual enhancements or some sound distortion, but these will be subt=
le.
> Trip Level 2: Beginner=E2=80=99s paradise
> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consiste=
nt sensorial=20
> accentuation, colors becoming brighter and a light body high. Level 2 can=
=20
> be a more intense form of Trip Level 1, but with the right dosage it can =
be=20
> something more. Be prepared for the beginnings of visual and auditory=20
> hallucinations: objects moving and coming to life along with geometrical=
=20
> forms when you close your eyes. It will be harder to concentrate and=20
> communicate and you will notice an increase in creativity along with an=
=20
> enhanced sensation, lightness and euphoria.
> Trip Level 3: Classic psychedelic trip
> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Lev=
el 3 is great for=20
> beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic expe=
rience, without=20
> overdoing the dosage. This level is where visual hallucinations along wit=
h=20
> the appearance of patterns and fractals will be evident. No more hinting =
or=20
> subtle flashes of visuals, it=E2=80=99s happening for real. The surface o=
f the=20
> object you=E2=80=99re observing will become shiny and moving, as your fie=
ld of=20
> depth is altered. Distortions in the aptitude to measure the passage of=
=20
> time, might cause an 1 hour to feel like an eternity.
> Level 4: Flying with the stars https:
> https://t.me/motionking_caliweed_psychedelics
>
> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong hal=
lucinations take=20
> over: a psychedelic flood of shapes, contours and colors will blend=20
> together and hit the shores of your consciousness. There=E2=80=99s no sto=
pping the=20
> waves in Level 4. There will be some moments when you will lose touch=20
> reality. Random, non-existent objects will appear and the concept of time=
=20
> will fade away to the background. Intriguing to some, scary to others, th=
is=20
> is the level where psychedelics can really be powerful, life-altering and=
=20
> mind expanding. Keep in mind that this dosage is only recommend for=20
> experience users.
> Level 5
>
> https://t.me/motionking_caliweed_psychedelics
>
> On Monday, June 3, 2024 at 4:06:43=E2=80=AFAM UTC+1 Asah Randy wrote:
>
>>
>>
>> =EE=A2=99
>> 17 of 3504
>> =EE=90=88
>> =EE=90=89
>> 4
>>
>> Skip to first unread message
>> =EE=A5=84
>> unread,
>> Jun 27, 2018, 5:33:04=E2=80=AFPM=EE=97=94
>> https://t.me/motionking_caliweed_psychedelics
>>
>> i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
>> using petalinux 2017.4 following this documentation :
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>
>> the second uart doesn't work. After a question on the Xilinx forum
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> i can activate /dev/ttyPS1 on the zcu102 and verify it using
>>
>> echo hello > /dev/ttyPS1
>>
>> but i still can't use it with jailhouse.
>>
>>
>> i have checked with the gic-demo and linux-demo without any success.
>> i can use the debug console with gic-demo, but that's all.
>>
>> this command should work, but it doesn't :
>>
>> jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
>> inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"
>>
>>
>> in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :
>>
>> .mem_regions =3D {
>> /* UART */ {
>> .phys_start =3D 0xff010000,
>> .virt_start =3D 0xff010000,
>> .size =3D 0x1000,
>> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED
>> https://t.me/motionking_caliweed_psychedelics
>> On Saturday, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayne Mickey wrot=
e:
>>
>>> Penis Envy magic mushrooms are three times more potent than other=20
>>> mushrooms. The effects of Penis Envy magic mushrooms may come on quickl=
y=20
>>> due to higher levels of psilocin than psilocybin.
>>> About Penis Envy
>>> Penis Envy magic mushrooms can impact you differently based upon a=20
>>> variety of factors, like your size, weight, your state of health, wheth=
er=20
>>> you have taken them before, the amount you take, and more. The setting =
in=20
>>> which you are taking them and who you are with are critical factors. Be=
ing=20
>>> in nature, in a safe, calm and tranquil setting, with no pending pressu=
res=20
>>> or obligations is ideal for the user.=20
>>>
>>> Trip Level 0: Microdosing
>>> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A mi=
cro-dose is a=20
>>> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=
=20
>>> creativity or feel less anxious. Microdosing trip levels capsules. Adde=
d as=20
>>> level 0, it=E2=80=99s meant to be taken along with your day-to-day rout=
ine.
>>> Trip Level 1: Happy go lucky
>>> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The ef=
fects are mild=20
>>> and similar to being high on weed. Music starts to feel better, strange=
rs=20
>>> seem more friendly and the mind is able to lose some control. You could=
=20
>>> have mild visual enhancements or some sound distortion, but these will =
be=20
>>> subtle.
>>> Trip Level 2: Beginner=E2=80=99s paradise
>>> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consis=
tent sensorial=20
>>> accentuation, colors becoming brighter and a light body high. Level 2 c=
an=20
>>> be a more intense form of Trip Level 1, but with the right dosage it ca=
n be=20
>>> something more. Be prepared for the beginnings of visual and auditory=
=20
>>> hallucinations: objects moving and coming to life along with geometrica=
l=20
>>> forms when you close your eyes. It will be harder to concentrate and=20
>>> communicate and you will notice an increase in creativity along with an=
=20
>>> enhanced sensation, lightness and euphoria.
>>> Trip Level 3: Classic psychedelic trip
>>> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip L=
evel 3 is great=20
>>> for beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedeli=
c experience,=20
>>> without overdoing the dosage. This level is where visual hallucinations=
=20
>>> along with the appearance of patterns and fractals will be evident. No =
more=20
>>> hinting or subtle flashes of visuals, it=E2=80=99s happening for real. =
The surface=20
>>> of the object you=E2=80=99re observing will become shiny and moving, as=
 your field=20
>>> of depth is altered. Distortions in the aptitude to measure the passage=
 of=20
>>> time, might cause an 1 hour to feel like an eternity.
>>> Level 4: Flying with the stars https:t.me/Ricko_swavy8
>>> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong h=
allucinations=20
>>> take over: a psychedelic flood of shapes, contours and colors will blen=
d=20
>>> together and hit the shores of your consciousness. There=E2=80=99s no s=
topping the=20
>>> waves in Level 4. There will be some moments when you will lose touch=
=20
>>> reality. Random, non-existent objects will appear and the concept of ti=
me=20
>>> will fade away to the background. Intriguing to some, scary to others, =
this=20
>>> is the level where psychedelics can really be powerful, life-altering a=
nd=20
>>> mind expanding. Keep in mind that this dosage is only recommend for=20
>>> experience users.
>>> Level 5
>>> :https:t.me/Ricko_swavy8
>>>
>>> On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1 christophe...@g=
mail.com=20
>>> wrote:
>>>
>>>> hi all,
>>>>
>>>> now i can see the output of the console and monitor the linux boot.
>>>> And of course, linux doesn't boot and stop with a kernel panic :=20
>>>>
>>>> [ 9.148409] NET: Registered protocol family 1
>>>> [ 9.200596] RPC: Registered named UNIX socket transport module.
>>>> [ 9.271265] RPC: Registered udp transport module.
>>>> [ 9.327501] RPC: Registered tcp transport module.
>>>> [ 9.383752] RPC: Registered tcp NFSv4.1 backchannel transport module.
>>>> [ 9.814860] Kernel panic - not syncing: write error
>>>> [ 9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=20
>>>> 4.9.0-xilinx-v2017.4 #2
>>>> [ 9.957622] Hardware name: Jailhouse cell on ZynqMP ZCU102 (DT)
>>>> [ 10.028458] Call trace:
>>>> [ 10.057635] [<ffffff8008088138>] dump_backtrace+0x0/0x198
>>>> [ 10.122215] [<ffffff80080882e4>] show_stack+0x14/0x20
>>>> [ 10.182634] [<ffffff80083de594>] dump_stack+0x94/0xb8
>>>> [ 10.243054] [<ffffff800812e9f8>] panic+0x114/0x25c
>>>> [ 10.300347] [<ffffff8008cc2d8c>] populate_rootfs+0x40/0x110
>>>> [ 10.367014] [<ffffff80080830b8>] do_one_initcall+0x38/0x128
>>>> [ 10.433683] [<ffffff8008cc0c94>] kernel_init_freeable+0x140/0x1e0
>>>> [ 10.506604] [<ffffff80089494e0>] kernel_init+0x10/0x100
>>>> [ 10.569104] [<ffffff8008082e80>] ret_from_fork+0x10/0x50
>>>> [ 10.632647] SMP: stopping secondary CPUs
>>>> [ 10.679537] ---[ end Kernel panic - not syncing: write error
>>>>
>>>> i can see a write error, but i don't know why.
>>>> i have attached the boot log file.
>>>>
>>>> Any hints ?
>>>>
>>>> Regards=20
>>>> C.Alexandre=20
>>>>
>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cfa7782b-6db4-4434-9d24-aadbee870488n%40googlegroups.com.

------=_Part_258991_713131651.1717891819895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_b=
lank" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232);">https://t.me/mot=
ionking_caliweed_psychedelics</a><br /></div><div><br /></div><div><a href=
=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D=
"nofollow" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_cali=
weed_psychedelics</a><br /></div><div style=3D"color: rgb(80, 0, 80);">Peni=
s Envy magic mushrooms are three times more potent than other mushrooms. Th=
e effects of Penis Envy magic mushrooms may come on quickly due to higher l=
evels of psilocin than psilocybin.<div>About Penis Envy</div><div>Penis Env=
y magic mushrooms can impact you differently based upon a variety of factor=
s, like your size, weight, your state of health, whether you have taken the=
m before, the amount you take, and more. The setting in which you are takin=
g them and who you are with are critical factors. Being in nature, in a saf=
e, calm and tranquil setting, with no pending pressures or obligations is i=
deal for the user.=C2=A0</div><div><br /></div><div>Trip Level 0: Microdosi=
ng</div><div>Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=
=80=93 A micro-dose is a sub-perceptual amount of mushrooms. Take this ever=
y 2-3 days to boost creativity or feel less anxious. Microdosing trip level=
s capsules. Added as level 0, it=E2=80=99s meant to be taken along with you=
r day-to-day routine.</div><div>Trip Level 1: Happy go lucky</div><div>Reco=
mmended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effects ar=
e mild and similar to being high on weed. Music starts to feel better, stra=
ngers seem more friendly and the mind is able to lose some control. You cou=
ld have mild visual enhancements or some sound distortion, but these will b=
e subtle.</div><div>Trip Level 2: Beginner=E2=80=99s paradise</div><div>Rec=
ommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consistent se=
nsorial accentuation, colors becoming brighter and a light body high. Level=
 2 can be a more intense form of Trip Level 1, but with the right dosage it=
 can be something more. Be prepared for the beginnings of visual and audito=
ry hallucinations: objects moving and coming to life along with geometrical=
 forms when you close your eyes. It will be harder to concentrate and commu=
nicate and you will notice an increase in creativity along with an enhanced=
 sensation, lightness and euphoria.</div><div>Trip Level 3: Classic psyched=
elic trip</div><div>Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =
=E2=80=93 Trip Level 3 is great for beginners who want to jump in the =E2=
=80=9Creal=E2=80=9D psychedelic experience, without overdoing the dosage. T=
his level is where visual hallucinations along with the appearance of patte=
rns and fractals will be evident. No more hinting or subtle flashes of visu=
als, it=E2=80=99s happening for real. The surface of the object you=E2=80=
=99re observing will become shiny and moving, as your field of depth is alt=
ered. Distortions in the aptitude to measure the passage of time, might cau=
se an 1 hour to feel like an eternity.</div></div><div>Level 4: Flying with=
 the stars https:<a href=3D"https://t.me/motionking_caliweed_psychedelics" =
target=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232);">http=
s://t.me/motionking_caliweed_psychedelics</a></div><div style=3D"color: rgb=
(80, 0, 80);"><div><br /></div></div><a href=3D"https://t.me/motionking_cal=
iweed_psychedelics" target=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(=
26, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a><br /><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, Ju=
ne 3, 2024 at 4:10:23=E2=80=AFAM UTC+1 Asah Randy wrote:<br/></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;"><div><a href=3D"https://t.me/mo=
tionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saf=
eredirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/mot=
ionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978124426000=
&amp;usg=3DAOvVaw1o3oXnrCvZjNqRGjpVBCGx">https://t.me/motionking_caliweed_p=
sychedelics</a><br></div><div><br></div>Penis Envy magic mushrooms are thre=
e times more potent than other mushrooms. The effects of Penis Envy magic m=
ushrooms may come on quickly due to higher levels of psilocin than psilocyb=
in.<div>About Penis Envy</div><div>Penis Envy magic mushrooms can impact yo=
u differently based upon a variety of factors, like your size, weight, your=
 state of health, whether you have taken them before, the amount you take, =
and more. The setting in which you are taking them and who you are with are=
 critical factors. Being in nature, in a safe, calm and tranquil setting, w=
ith no pending pressures or obligations is ideal for the user.=C2=A0</div><=
div><br></div><div>Trip Level 0: Microdosing</div><div>Recommended dosage: =
0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micro-dose is a sub-percep=
tual amount of mushrooms. Take this every 2-3 days to boost creativity or f=
eel less anxious. Microdosing trip levels capsules. Added as level 0, it=E2=
=80=99s meant to be taken along with your day-to-day routine.</div><div>Tri=
p Level 1: Happy go lucky</div><div>Recommended dosage: 0.8 =E2=80=93 1 g. =
dried mushrooms =E2=80=93 The effects are mild and similar to being high on=
 weed. Music starts to feel better, strangers seem more friendly and the mi=
nd is able to lose some control. You could have mild visual enhancements or=
 some sound distortion, but these will be subtle.</div><div>Trip Level 2: B=
eginner=E2=80=99s paradise</div><div>Recommended dosage: 1 =E2=80=93 1.5 g.=
 dried mushrooms =E2=80=93 Consistent sensorial accentuation, colors becomi=
ng brighter and a light body high. Level 2 can be a more intense form of Tr=
ip Level 1, but with the right dosage it can be something more. Be prepared=
 for the beginnings of visual and auditory hallucinations: objects moving a=
nd coming to life along with geometrical forms when you close your eyes. It=
 will be harder to concentrate and communicate and you will notice an incre=
ase in creativity along with an enhanced sensation, lightness and euphoria.=
</div><div>Trip Level 3: Classic psychedelic trip</div><div>Recommended dos=
age: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Level 3 is great for=
 beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic exper=
ience, without overdoing the dosage. This level is where visual hallucinati=
ons along with the appearance of patterns and fractals will be evident. No =
more hinting or subtle flashes of visuals, it=E2=80=99s happening for real.=
 The surface of the object you=E2=80=99re observing will become shiny and m=
oving, as your field of depth is altered. Distortions in the aptitude to me=
asure the passage of time, might cause an 1 hour to feel like an eternity.<=
/div><div>Level 4: Flying with the stars https:<a href=3D"https://t.me/moti=
onking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motio=
nking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978124427000&a=
mp;usg=3DAOvVaw2ZLJdX0UBMC7ozvavlN6A_">https://t.me/motionking_caliweed_psy=
chedelics</a></div><div><br></div><div>Recommended dosage: 3 =E2=80=93 4 g.=
 dried mushrooms =E2=80=93 Strong hallucinations take over: a psychedelic f=
lood of shapes, contours and colors will blend together and hit the shores =
of your consciousness. There=E2=80=99s no stopping the waves in Level 4. Th=
ere will be some moments when you will lose touch reality. Random, non-exis=
tent objects will appear and the concept of time will fade away to the back=
ground. Intriguing to some, scary to others, this is the level where psyche=
delics can really be powerful, life-altering and mind expanding. Keep in mi=
nd that this dosage is only recommend for experience users.</div><div>Level=
 5</div><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psy=
chedelics" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psyc=
hedelics&amp;source=3Dgmail&amp;ust=3D1717978124427000&amp;usg=3DAOvVaw2ZLJ=
dX0UBMC7ozvavlN6A_">https://t.me/motionking_caliweed_psychedelics</a><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">O=
n Monday, June 3, 2024 at 4:06:43=E2=80=AFAM UTC+1 Asah Randy wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><div style=3D=
"border-bottom:1px solid rgb(232,234,237);display:flex;min-height:51px"><di=
v style=3D"display:flex;margin-left:auto"><br><div style=3D"border-left:1px=
 solid rgb(221,221,221);display:inline-block;min-height:20px;margin:12px"><=
/div><div role=3D"button" aria-label=3D"You need the content moderator perm=
ission to delete conversations" aria-disabled=3D"true" style=3D"border:0px;=
border-radius:50%;display:inline-block;min-height:40px;outline:none;overflo=
w:hidden;text-align:center;width:40px;color:rgb(154,160,166)"><div style=3D=
"background-size:cover;opacity:0;background-image:radial-gradient(circle fa=
rthest-side,rgba(95,99,104,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0)=
 100%)"></div><span style=3D"display:flex;min-height:40px;width:40px"><span=
 style=3D"display:flex"></span></span></div><div role=3D"button" aria-label=
=3D"You need the content moderator permission to lock conversations" aria-d=
isabled=3D"true" style=3D"border:0px;border-radius:50%;display:inline-block=
;min-height:40px;outline:none;overflow:hidden;text-align:center;width:40px;=
color:rgb(154,160,166)"><div style=3D"background-size:cover;opacity:0;backg=
round-image:radial-gradient(circle farthest-side,rgba(95,99,104,0.16),rgba(=
95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=3D"display:f=
lex;min-height:40px;width:40px"><span style=3D"display:flex"><span aria-hid=
den=3D"true" style=3D"font-family:&quot;Material Icons Extended&quot;;font-=
size:20px;line-height:1;display:inline-block;direction:ltr;font-feature-set=
tings:&quot;liga&quot;">=EE=A2=99</span></span></span></div><div style=3D"b=
order-left:1px solid rgb(221,221,221);display:inline-block;min-height:20px;=
margin:12px"></div><div style=3D"display:flex;margin-left:8px"><div><div st=
yle=3D"display:flex;color:rgb(95,99,104);min-height:32px"><div style=3D"fon=
t-family:Roboto,Arial,sans-serif;letter-spacing:0.2px;line-height:20px;disp=
lay:flex">17 of 3504</div><div role=3D"button" aria-label=3D"Previous" styl=
e=3D"border:0px;border-radius:50%;display:inline-block;min-height:48px;outl=
ine:none;overflow:hidden;text-align:center;width:48px"><div style=3D"backgr=
ound-size:cover;opacity:0;background-image:radial-gradient(circle farthest-=
side,rgba(95,99,104,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"=
></div><span style=3D"display:flex;min-height:48px;width:48px"><span style=
=3D"display:flex"><span aria-hidden=3D"true" style=3D"font-family:&quot;Mat=
erial Icons Extended&quot;;font-size:24px;line-height:1;display:inline-bloc=
k;direction:ltr;font-feature-settings:&quot;liga&quot;">=EE=90=88</span></s=
pan></span></div><div role=3D"button" aria-label=3D"Next" style=3D"border:0=
px;border-radius:50%;display:inline-block;min-height:48px;outline:none;over=
flow:hidden;text-align:center;width:48px"><div style=3D"background-size:cov=
er;opacity:0;background-image:radial-gradient(circle farthest-side,rgba(95,=
99,104,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span =
style=3D"display:flex;min-height:48px;width:48px"><span style=3D"display:fl=
ex"><span aria-hidden=3D"true" style=3D"font-family:&quot;Material Icons Ex=
tended&quot;;font-size:24px;line-height:1;display:inline-block;direction:lt=
r;font-feature-settings:&quot;liga&quot;">=EE=90=89</span></span></span></d=
iv></div></div></div></div></div><div style=3D"overflow-y:auto;outline:none=
"><div style=3D"display:flex"><div style=3D"display:flex;min-width:0px"><di=
v style=3D"display:flex;padding:16px 16px 16px 0px"><span style=3D"display:=
inline-block;padding:0px;font-family:&quot;Google Sans&quot;,Roboto,Arial,s=
ans-serif;font-size:22px;line-height:28px;color:rgb(32,33,36);margin:0px;ou=
tline:none;word-break:break-word">4</span></div><div style=3D"color:rgb(95,=
99,104);display:inline-block"><br></div></div><div style=3D"display:flex"><=
div role=3D"button" style=3D"border:0px;border-radius:4px;color:rgb(95,99,1=
04);display:inline-block;font-family:&quot;Google Sans&quot;,Roboto,Arial,s=
ans-serif;letter-spacing:0.25px;line-height:36px;min-width:auto;outline:non=
e;overflow:hidden;text-align:center;min-height:1px"><div style=3D"backgroun=
d-size:cover;opacity:0;background-image:radial-gradient(circle farthest-sid=
e,rgba(0,0,0,0.12),rgba(0,0,0,0.12) 80%,rgba(0,0,0,0) 100%)"></div><div sty=
le=3D"background-color:rgb(95,99,104);opacity:0"></div><span style=3D"displ=
ay:flex;padding:0px 8px"><span style=3D"display:inline-block;margin:0px">Sk=
ip to first unread message</span></span></div><div><div role=3D"button" ari=
a-label=3D"Collapse all" style=3D"border:0px;border-radius:50%;display:inli=
ne-block;min-height:48px;outline:none;overflow:hidden;text-align:center;wid=
th:48px;color:rgb(95,99,104)"><div style=3D"background-size:cover;opacity:0=
;background-image:radial-gradient(circle farthest-side,rgba(95,99,104,0.16)=
,rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=3D"dis=
play:flex;min-height:48px;width:48px"><span style=3D"display:flex"><span ar=
ia-hidden=3D"true" style=3D"font-family:&quot;Material Icons Extended&quot;=
;font-size:20px;line-height:1;display:inline-block;direction:ltr;font-featu=
re-settings:&quot;liga&quot;">=EE=A5=84</span></span></span></div></div></d=
iv></div><div role=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second =
UART problem + petalinux 2017.4"><span role=3D"listitem" aria-expanded=3D"t=
rue" style=3D"border-bottom:1px solid rgb(232,234,237);padding-top:8px;padd=
ing-left:0px;border-left:2px solid rgb(77,144,240)"><div style=3D"outline:n=
one"><div style=3D"display:flex"><div style=3D"min-width:0px"><div><div sty=
le=3D"color:rgb(95,99,104);display:flex;min-height:48px"><span style=3D"min=
-height:1px;margin:0px;overflow:hidden;padding:0px;white-space:nowrap;width=
:1px">unread,</span><div style=3D"font-family:Roboto,Arial,sans-serif;font-=
size:12px;letter-spacing:0.3px;line-height:16px;display:flex">Jun 27, 2018,=
 5:33:04=E2=80=AFPM<span style=3D"font-family:&quot;Material Icons Extended=
&quot;;font-size:20px;letter-spacing:normal;text-align:center">=EE=97=94</s=
pan></div></div></div><div role=3D"region" aria-labelledby=3D"c14597" style=
=3D"margin:12px 0px;overflow:auto;padding-right:20px"><a href=3D"https://t.=
me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" dat=
a-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.m=
e/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D17179781244=
27000&amp;usg=3DAOvVaw2ZLJdX0UBMC7ozvavlN6A_">https://t.me/motionking_caliw=
eed_psychedelics</a></div></div></div></div></span></div></div><div style=
=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"jailhous=
e + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><span role=3D"lis=
titem" aria-expanded=3D"true" style=3D"border-bottom:1px solid rgb(232,234,=
237);padding-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)=
"><div style=3D"outline:none"><div style=3D"display:flex"><div style=3D"min=
-width:0px"><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margin=
:12px 0px;overflow:auto;padding-right:20px"><br><p>i&#39;m trying to make j=
ailhouse work on my ZCU102 v1.0 (production)<br>using petalinux 2017.4 foll=
owing this documentation :</p></div></div></div></div></span></div></div><d=
iv style=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"=
jailhouse + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><span rol=
e=3D"listitem" aria-expanded=3D"true" style=3D"border-bottom:1px solid rgb(=
232,234,237);padding-top:8px;padding-left:0px;border-left:2px solid rgb(77,=
144,240)"><div style=3D"outline:none"><div style=3D"display:flex"><div styl=
e=3D"min-width:0px"><div role=3D"region" aria-labelledby=3D"c14597" style=
=3D"margin:12px 0px;overflow:auto;padding-right:20px"><p><a href=3D"https:/=
/t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://=
t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D17179781=
24427000&amp;usg=3DAOvVaw2ZLJdX0UBMC7ozvavlN6A_">https://t.me/motionking_ca=
liweed_psychedelics</a><br></p></div></div></div></div></span></div></div><=
div style=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-label=3D=
"jailhouse + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><span ro=
le=3D"listitem" aria-expanded=3D"true" style=3D"border-bottom:1px solid rgb=
(232,234,237);padding-top:8px;padding-left:0px;border-left:2px solid rgb(77=
,144,240)"><div style=3D"outline:none"><div style=3D"display:flex"><div sty=
le=3D"min-width:0px"><div role=3D"region" aria-labelledby=3D"c14597" style=
=3D"margin:12px 0px;overflow:auto;padding-right:20px"><p><br>the second uar=
t doesn&#39;t work. After a question on the Xilinx forum</p></div></div></d=
iv></div></span></div></div><div style=3D"overflow-y:auto;outline:none"><di=
v role=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART problem=
 + petalinux 2017.4"><span role=3D"listitem" aria-expanded=3D"true" style=
=3D"border-bottom:1px solid rgb(232,234,237);padding-top:8px;padding-left:0=
px;border-left:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div =
style=3D"display:flex"><div style=3D"min-width:0px"><div role=3D"region" ar=
ia-labelledby=3D"c14597" style=3D"margin:12px 0px;overflow:auto;padding-rig=
ht:20px"><p><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;s=
ource=3Dgmail&amp;ust=3D1717978124427000&amp;usg=3DAOvVaw2ZLJdX0UBMC7ozvavl=
N6A_">https://t.me/motionking_caliweed_psychedelics</a><br></p></div></div>=
</div></div></span></div></div><div style=3D"overflow-y:auto;outline:none">=
<div role=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART prob=
lem + petalinux 2017.4"><span role=3D"listitem" aria-expanded=3D"true" styl=
e=3D"border-bottom:1px solid rgb(232,234,237);padding-top:8px;padding-left:=
0px;border-left:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div=
 style=3D"display:flex"><div style=3D"min-width:0px"><div role=3D"region" a=
ria-labelledby=3D"c14597" style=3D"margin:12px 0px;overflow:auto;padding-ri=
ght:20px"><p>i can activate /dev/ttyPS1 on the zcu102 and verify it using</=
p><p>echo hello &gt; /dev/ttyPS1</p><p>but i still can&#39;t use it with ja=
ilhouse.</p><p><br>i have checked with the gic-demo and linux-demo without =
any success.<br>i can use the debug console with gic-demo, but that&#39;s a=
ll.</p><p>this command should work, but it doesn&#39;t :</p><p>jailhouse ce=
ll linux zynqmp-zcu102-linux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -i=
 rootfs.cpio -c &quot;console=3DttyPS1,115200&quot;</p><p><br>in the zynqmp=
-zcu102-linux-demo.c file, the uart address is correct :</p><p>.mem_regions=
 =3D {<br>/* UART */ {<br>.phys_start =3D 0xff010000,<br>.virt_start =3D 0x=
ff010000,<br>.size =3D 0x1000,<br>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |<br>JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED</p></div></div>=
</div></div></span></div></div><div style=3D"overflow-y:auto;outline:none">=
<div role=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART prob=
lem + petalinux 2017.4"><span role=3D"listitem" aria-expanded=3D"true" styl=
e=3D"border-bottom:1px solid rgb(232,234,237);padding-top:8px;padding-left:=
0px;border-left:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div=
 style=3D"display:flex"><div style=3D"min-width:0px"><div role=3D"region" a=
ria-labelledby=3D"c14597" style=3D"margin:12px 0px;overflow:auto;padding-ri=
ght:20px"></div></div></div></div></span></div></div><a href=3D"https://t.m=
e/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data=
-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me=
/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D171797812442=
7000&amp;usg=3DAOvVaw2ZLJdX0UBMC7ozvavlN6A_">https://t.me/motionking_caliwe=
ed_psychedelics</a><br><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">On Saturday, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayn=
e Mickey wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Penis =
Envy magic mushrooms are three times more potent than other mushrooms.  The=
 effects of Penis Envy magic mushrooms may come on quickly due to higher le=
vels of psilocin than psilocybin.<div>About Penis Envy</div><div>Penis Envy=
 magic mushrooms can impact you differently based upon a variety of factors=
, like your size, weight, your state of health, whether you have taken them=
 before, the amount you take, and more.  The setting in which you are takin=
g them and who you are with are critical factors.  Being in nature, in a sa=
fe, calm and tranquil setting, with no pending pressures or obligations is =
ideal for the user.=C2=A0</div><div><br></div><div>Trip Level 0: Microdosin=
g</div><div>Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=
=93 A micro-dose is a sub-perceptual amount of mushrooms. Take this every 2=
-3 days to boost creativity or feel less anxious. Microdosing trip levels c=
apsules. Added as level 0, it=E2=80=99s meant to be taken along with your d=
ay-to-day routine.</div><div>Trip Level 1: Happy go lucky</div><div>Recomme=
nded dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effects are m=
ild and similar to being high on weed. Music starts to feel better, strange=
rs seem more friendly and the mind is able to lose some control. You could =
have mild visual enhancements or some sound distortion, but these will be s=
ubtle.</div><div>Trip Level 2: Beginner=E2=80=99s paradise</div><div>Recomm=
ended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consistent senso=
rial accentuation, colors becoming brighter and a light body high. Level 2 =
can be a more intense form of Trip Level 1, but with the right dosage it ca=
n be something more. Be prepared for the beginnings of visual and auditory =
hallucinations: objects moving and coming to life along with geometrical fo=
rms when you close your eyes. It will be harder to concentrate and communic=
ate and you will notice an increase in creativity along with an enhanced se=
nsation, lightness and euphoria.</div><div>Trip Level 3: Classic psychedeli=
c trip</div><div>Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=
=80=93 Trip Level 3 is great for beginners who want to jump in the =E2=80=
=9Creal=E2=80=9D psychedelic experience, without overdoing the dosage. This=
 level is where visual hallucinations along with the appearance of patterns=
 and fractals will be evident. No more hinting or subtle flashes of visuals=
, it=E2=80=99s happening for real. The surface of the object you=E2=80=99re=
 observing will become shiny and moving, as your field of depth is altered.=
 Distortions in the aptitude to measure the passage of time, might cause an=
 1 hour to feel like an eternity.</div><div>Level 4: Flying with the stars =
https:<a href=3D"http://t.me/Ricko_swavy8" rel=3D"nofollow" target=3D"_blan=
k" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp:=
//t.me/Ricko_swavy8&amp;source=3Dgmail&amp;ust=3D1717978124427000&amp;usg=
=3DAOvVaw2XBAdphKPJJ48JTYqXg0f1">t.me/Ricko_swavy8</a></div><div>Recommende=
d dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong hallucinations =
take over: a psychedelic flood of shapes, contours and colors will blend to=
gether and hit the shores of your consciousness. There=E2=80=99s no stoppin=
g the waves in Level 4. There will be some moments when you will lose touch=
 reality. Random, non-existent objects will appear and the concept of time =
will fade away to the background. Intriguing to some, scary to others, this=
 is the level where psychedelics can really be powerful, life-altering and =
mind expanding. Keep in mind that this dosage is only recommend for experie=
nce users.</div><div>Level 5</div><div>:https:<a href=3D"http://t.me/Ricko_=
swavy8" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://=
www.google.com/url?hl=3Den&amp;q=3Dhttp://t.me/Ricko_swavy8&amp;source=3Dgm=
ail&amp;ust=3D1717978124427000&amp;usg=3DAOvVaw2XBAdphKPJJ48JTYqXg0f1">t.me=
/Ricko_swavy8</a><br><br></div><div class=3D"gmail_quote"><div dir=3D"auto"=
 class=3D"gmail_attr">On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC=
+1 <a rel=3D"nofollow">christophe...@gmail.com</a> wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">hi all,<p>now i can see the output of t=
he console and monitor the linux boot.<br>And of course, linux doesn&#39;t =
boot and stop with a kernel panic : <p>[    9.148409] NET: Registered proto=
col family 1<br>[    9.200596] RPC: Registered named UNIX socket transport =
module.<br>[    9.271265] RPC: Registered udp transport module.<br>[    9.3=
27501] RPC: Registered tcp transport module.<br>[    9.383752] RPC: Registe=
red tcp NFSv4.1 backchannel transport module.<br>[    9.814860] Kernel pani=
c - not syncing: write error<br>[    9.872207] CPU: 0 PID: 1 Comm: swapper/=
0 Not tainted 4.9.0-xilinx-v2017.4 #2<br>[    9.957622] Hardware name: Jail=
house cell on ZynqMP ZCU102 (DT)<br>[   10.028458] Call trace:<br>[   10.05=
7635] [&lt;ffffff8008088138&gt;] dump_backtrace+0x0/0x198<br>[   10.122215]=
 [&lt;ffffff80080882e4&gt;] show_stack+0x14/0x20<br>[   10.182634] [&lt;fff=
fff80083de594&gt;] dump_stack+0x94/0xb8<br>[   10.243054] [&lt;ffffff800812=
e9f8&gt;] panic+0x114/0x25c<br>[   10.300347] [&lt;ffffff8008cc2d8c&gt;] po=
pulate_rootfs+0x40/0x110<br>[   10.367014] [&lt;ffffff80080830b8&gt;] do_on=
e_initcall+0x38/0x128<br>[   10.433683] [&lt;ffffff8008cc0c94&gt;] kernel_i=
nit_freeable+0x140/0x1e0<br>[   10.506604] [&lt;ffffff80089494e0&gt;] kerne=
l_init+0x10/0x100<br>[   10.569104] [&lt;ffffff8008082e80&gt;] ret_from_for=
k+0x10/0x50<br>[   10.632647] SMP: stopping secondary CPUs<br>[   10.679537=
] ---[ end Kernel panic - not syncing: write error<p>i can see a write erro=
r, but i don&#39;t know why.<br>i have attached the boot log file.<p>Any hi=
nts ?<p>Regards <br>C.Alexandre </p></p></p></p></p></blockquote></div></bl=
ockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cfa7782b-6db4-4434-9d24-aadbee870488n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cfa7782b-6db4-4434-9d24-aadbee870488n%40googlegroups.co=
m</a>.<br />

------=_Part_258991_713131651.1717891819895--

------=_Part_258990_423569019.1717891819895--
