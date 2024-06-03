Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBRHG6SZAMGQEHFEHPCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55E8D7A5C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 05:06:46 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dfa78a1b142sf3848343276.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717384005; x=1717988805; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amU6Zd0uh/1/KdOyxGkbnROR4DePCvxEMG25m0lNFtk=;
        b=hlxKKPQOPNRGonvg8+vBIIBygAilzldWtTt623gmRiUPUhWX0CEFe5XBP6J4GLxLwM
         PHGQImaa9Oee8fPElruyeq72aE7+a7u9wDJD+CT7tzo5VZeel0fUtFCBPWIQhcU9c/8r
         cQeg3dee7bPqNSYEscPr0JvOGecbMQdfx72dwmch/GpQ5IxBccTxwoP15puccYBCxfqi
         YHQcM649ag0LW5/lK0MwEodF6b9/4hSPeLrgRvF2dj7GZorN9byhyVqyoG0ynk3E6bnF
         f9GqLfCRmqqsTiFMu09aufV06Z6VD3dhUWjknZnxkl2LtPsLBtJKx7xkujRyK5bZJgSO
         2WXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717384005; x=1717988805; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amU6Zd0uh/1/KdOyxGkbnROR4DePCvxEMG25m0lNFtk=;
        b=Ne9KbYQg0tnxmo8F4MhF7/K0w8BCsz7QmZwlmN/oRRjWQiBSAPQaR8dfyBoBxY3iJv
         eLDlxmgjh1oGFHD8PGoSGH3BURBU5loza1MKKz2jpYk0zAGP/LNJHsxNeWdKK9RMCvLk
         k7UbRBcYXWsiyuTYncGYQt3XtqDEpM6o3E5lSOLRH1AgXlaB8YbLRsplKNG+wXBAfNOc
         IyFTXj5IWq2Ww+y0qb+Hh5Qyw7INBKL7f+bKTKURQ0UNwObgNSwMF+5/lhLRZ21LVb3x
         fYGeg8hzlYAyFU/SSB/f6kTc2Hs2IcxQ2hrvJ8VbSHd3J0uyedEK3Gt4GXidBiX4t8rC
         9WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717384005; x=1717988805;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amU6Zd0uh/1/KdOyxGkbnROR4DePCvxEMG25m0lNFtk=;
        b=eTafSzu5TpUZSowL5i9gnHWgNvj/N3YYU3eFNBwuOKm0iD2MvhCqi+dMeAbm/rSll9
         QIJmc5fO14BvL9/YVFh+1OVxKf/YNsos8QUSU3SHEvP/1ill1wxrXjKdSFMjVfldOcRG
         y4LxM/PDgLuJvT9Y6Njp4GFdnYxKxY1QOPEDMwJ4skWP6MziQWUf2/RFbkOTqN0hjKZn
         kFOoJzF4xShP0j2/3UEYm7aOewssI3B1ww3zxh12j0Vr5l2QoHzWIuFK4Y17y93DXHa+
         cRtLoGQCWy9IbyUUS7VoKfLJankQH+FC3ATNw6vdG5u09/BEIQV5tbGVcCOMKk5a/jgM
         FQ2A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUkxfMZWwvCjOfIIDydA1Alo/mRfQI5+IbTICc4Ye/4AuXs6ov/jHbuhB6QHw1bbTfMccmTbvHKqIrvjNeFpOFUe5W/FQ1tfD+Az+4=
X-Gm-Message-State: AOJu0YwOkVoeZlkU+Qf5x+eoGEp9zUw36LT88fu4SVNZDlhTbB472RHH
	zXcRLReGl3AogAg2fyB6GvpjLvWaTqYND4hTLtiJRpjt7dYSljBm
X-Google-Smtp-Source: AGHT+IGceWPxrvUr1SQXFrQPSEHIM/gBwRQLmWlXTCqgRZWrWOcaUyLIbFppYlKEU+ro12nfdf9cHQ==
X-Received: by 2002:a25:db04:0:b0:df4:46a6:77ed with SMTP id 3f1490d57ef6-dfa73c4df61mr8042366276.27.1717384005203;
        Sun, 02 Jun 2024 20:06:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bc3:0:b0:dfa:7e23:93a1 with SMTP id 3f1490d57ef6-dfa7e23962fls778576276.0.-pod-prod-06-us;
 Sun, 02 Jun 2024 20:06:44 -0700 (PDT)
X-Received: by 2002:a05:690c:f14:b0:61b:e15c:2b84 with SMTP id 00721157ae682-62c7981f3aemr28433407b3.6.1717384003649;
        Sun, 02 Jun 2024 20:06:43 -0700 (PDT)
Date: Sun, 2 Jun 2024 20:06:42 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5ac62ff7-670a-40a2-9271-700b1f8d7f86n@googlegroups.com>
In-Reply-To: <aa79214c-06f5-482d-9b3a-18cdfd9a1909n@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
 <b233e3c5-c126-4ff1-a109-8d2862e939ee@googlegroups.com>
 <aa79214c-06f5-482d-9b3a-18cdfd9a1909n@googlegroups.com>
Subject: Re: jailhouse + ZCU102 V1.0 + second UART problem + petalinux
 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_114612_1084070541.1717384002878"
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

------=_Part_114612_1084070541.1717384002878
Content-Type: multipart/alternative; 
	boundary="----=_Part_114613_989140744.1717384002878"

------=_Part_114613_989140744.1717384002878
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



=EE=A2=99
17 of 3504
=EE=90=88
=EE=90=89
4

Skip to first unread message
=EE=A5=84
unread,
Jun 27, 2018, 5:33:04=E2=80=AFPM=EE=97=94
https://t.me/motionking_caliweed_psychedelics

i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
using petalinux 2017.4 following this documentation :

https://t.me/motionking_caliweed_psychedelics


the second uart doesn't work. After a question on the Xilinx forum

https://t.me/motionking_caliweed_psychedelics

i can activate /dev/ttyPS1 on the zcu102 and verify it using

echo hello > /dev/ttyPS1

but i still can't use it with jailhouse.


i have checked with the gic-demo and linux-demo without any success.
i can use the debug console with gic-demo, but that's all.

this command should work, but it doesn't :

jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"


in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :

.mem_regions =3D {
/* UART */ {
.phys_start =3D 0xff010000,
.virt_start =3D 0xff010000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED
https://t.me/motionking_caliweed_psychedelics
On Saturday, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayne Mickey wrote:

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
> Level 4: Flying with the stars https:t.me/Ricko_swavy8
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
> :https:t.me/Ricko_swavy8
>
> On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1 christophe...@gma=
il.com=20
> wrote:
>
>> hi all,
>>
>> now i can see the output of the console and monitor the linux boot.
>> And of course, linux doesn't boot and stop with a kernel panic :=20
>>
>> [ 9.148409] NET: Registered protocol family 1
>> [ 9.200596] RPC: Registered named UNIX socket transport module.
>> [ 9.271265] RPC: Registered udp transport module.
>> [ 9.327501] RPC: Registered tcp transport module.
>> [ 9.383752] RPC: Registered tcp NFSv4.1 backchannel transport module.
>> [ 9.814860] Kernel panic - not syncing: write error
>> [ 9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=20
>> 4.9.0-xilinx-v2017.4 #2
>> [ 9.957622] Hardware name: Jailhouse cell on ZynqMP ZCU102 (DT)
>> [ 10.028458] Call trace:
>> [ 10.057635] [<ffffff8008088138>] dump_backtrace+0x0/0x198
>> [ 10.122215] [<ffffff80080882e4>] show_stack+0x14/0x20
>> [ 10.182634] [<ffffff80083de594>] dump_stack+0x94/0xb8
>> [ 10.243054] [<ffffff800812e9f8>] panic+0x114/0x25c
>> [ 10.300347] [<ffffff8008cc2d8c>] populate_rootfs+0x40/0x110
>> [ 10.367014] [<ffffff80080830b8>] do_one_initcall+0x38/0x128
>> [ 10.433683] [<ffffff8008cc0c94>] kernel_init_freeable+0x140/0x1e0
>> [ 10.506604] [<ffffff80089494e0>] kernel_init+0x10/0x100
>> [ 10.569104] [<ffffff8008082e80>] ret_from_fork+0x10/0x50
>> [ 10.632647] SMP: stopping secondary CPUs
>> [ 10.679537] ---[ end Kernel panic - not syncing: write error
>>
>> i can see a write error, but i don't know why.
>> i have attached the boot log file.
>>
>> Any hints ?
>>
>> Regards=20
>> C.Alexandre=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5ac62ff7-670a-40a2-9271-700b1f8d7f86n%40googlegroups.com.

------=_Part_114613_989140744.1717384002878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div style=3D"border-bottom: 1px solid rgb(232, 234, 237);=
 display: flex; height: 51px;"><div style=3D"align-items: center; display: =
flex; justify-content: center; margin-left: auto;"><br /><div style=3D"bord=
er-left: 1px solid rgb(221, 221, 221); display: inline-block; height: 20px;=
 margin: 12px;"></div><div role=3D"button" aria-label=3D"You need the conte=
nt moderator permission to delete conversations" aria-disabled=3D"true" tab=
index=3D"-1" style=3D"user-select: none; transition: background 0.3s ease 0=
s; border: 0px; border-radius: 50%; cursor: default; display: inline-block;=
 flex-shrink: 0; height: 40px; outline: none; overflow: hidden; position: r=
elative; text-align: center; width: 40px; z-index: 0; color: rgb(154, 160, =
166); fill: rgb(154, 160, 166);"><div style=3D"transform: translate(-50%, -=
50%) scale(0); transition: opacity 0.2s ease 0s, visibility 0s ease 0.2s, t=
ransform 0s ease 0.2s, -webkit-transform 0s ease 0.2s; background-size: cov=
er; left: 0px; opacity: 0; pointer-events: none; position: absolute; top: 0=
px; visibility: hidden; background-image: radial-gradient(circle farthest-s=
ide, rgba(95, 99, 104, 0.16), rgba(95, 99, 104, 0.16) 80%, rgba(95, 99, 104=
, 0) 100%);"></div><span style=3D"align-items: center; display: flex; heigh=
t: 40px; justify-content: center; position: relative; width: 40px;"><span s=
tyle=3D"display: flex; position: relative;"></span></span></div><div role=
=3D"button" aria-label=3D"You need the content moderator permission to lock=
 conversations" aria-disabled=3D"true" tabindex=3D"-1" style=3D"user-select=
: none; transition: background 0.3s ease 0s; border: 0px; border-radius: 50=
%; cursor: default; display: inline-block; flex-shrink: 0; height: 40px; ou=
tline: none; overflow: hidden; position: relative; text-align: center; widt=
h: 40px; z-index: 0; color: rgb(154, 160, 166); fill: rgb(154, 160, 166);">=
<div style=3D"transform: translate(-50%, -50%) scale(0); transition: opacit=
y 0.2s ease 0s, visibility 0s ease 0.2s, transform 0s ease 0.2s, -webkit-tr=
ansform 0s ease 0.2s; background-size: cover; left: 0px; opacity: 0; pointe=
r-events: none; position: absolute; top: 0px; visibility: hidden; backgroun=
d-image: radial-gradient(circle farthest-side, rgba(95, 99, 104, 0.16), rgb=
a(95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) 100%);"></div><span style=3D=
"align-items: center; display: flex; height: 40px; justify-content: center;=
 position: relative; width: 40px;"><span style=3D"display: flex; position: =
relative;"><span aria-hidden=3D"true" style=3D"font-family: &quot;Material =
Icons Extended&quot;; font-size: 20px; line-height: 1; text-rendering: opti=
mizelegibility; display: inline-block; overflow-wrap: normal; direction: lt=
r; font-feature-settings: &quot;liga&quot;;">=EE=A2=99</span></span></span>=
</div><div style=3D"border-left: 1px solid rgb(221, 221, 221); display: inl=
ine-block; height: 20px; margin: 12px;"></div><div style=3D"align-items: ce=
nter; display: flex; justify-content: center; margin-left: 8px;"><div><div =
style=3D"align-items: center; display: flex; color: rgb(95, 99, 104); justi=
fy-content: center; height: 32px;"><div style=3D"font-family: Roboto, Arial=
, sans-serif; letter-spacing: 0.2px; line-height: 20px; align-self: center;=
 display: flex; flex-shrink: 0; justify-content: center;">17 of 3504</div><=
div role=3D"button" aria-label=3D"Previous" tabindex=3D"0" style=3D"user-se=
lect: none; transition: background 0.3s ease 0s; border: 0px; border-radius=
: 50%; cursor: pointer; display: inline-block; flex-shrink: 0; height: 48px=
; outline: none; overflow: hidden; position: relative; text-align: center; =
width: 48px; z-index: 0; fill: rgb(95, 99, 104);"><div style=3D"transform: =
translate(-50%, -50%) scale(0); transition: opacity 0.2s ease 0s, visibilit=
y 0s ease 0.2s, transform 0s ease 0.2s, -webkit-transform 0s ease 0.2s; bac=
kground-size: cover; left: 0px; opacity: 0; pointer-events: none; position:=
 absolute; top: 0px; visibility: hidden; background-image: radial-gradient(=
circle farthest-side, rgba(95, 99, 104, 0.16), rgba(95, 99, 104, 0.16) 80%,=
 rgba(95, 99, 104, 0) 100%);"></div><span style=3D"align-items: center; dis=
play: flex; height: 48px; justify-content: center; position: relative; widt=
h: 48px;"><span style=3D"display: flex; position: relative;"><span aria-hid=
den=3D"true" style=3D"font-family: &quot;Material Icons Extended&quot;; fon=
t-size: 24px; line-height: 1; text-rendering: optimizelegibility; display: =
inline-block; overflow-wrap: normal; direction: ltr; font-feature-settings:=
 &quot;liga&quot;;">=EE=90=88</span></span></span></div><div role=3D"button=
" aria-label=3D"Next" tabindex=3D"0" style=3D"user-select: none; transition=
: background 0.3s ease 0s; border: 0px; border-radius: 50%; cursor: pointer=
; display: inline-block; flex-shrink: 0; height: 48px; outline: none; overf=
low: hidden; position: relative; text-align: center; width: 48px; z-index: =
0; fill: rgb(95, 99, 104);"><div style=3D"transform: translate(-50%, -50%) =
scale(0); transition: opacity 0.2s ease 0s, visibility 0s ease 0.2s, transf=
orm 0s ease 0.2s, -webkit-transform 0s ease 0.2s; background-size: cover; l=
eft: 0px; opacity: 0; pointer-events: none; position: absolute; top: 0px; v=
isibility: hidden; background-image: radial-gradient(circle farthest-side, =
rgba(95, 99, 104, 0.16), rgba(95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) =
100%);"></div><span style=3D"align-items: center; display: flex; height: 48=
px; justify-content: center; position: relative; width: 48px;"><span style=
=3D"display: flex; position: relative;"><span aria-hidden=3D"true" style=3D=
"font-family: &quot;Material Icons Extended&quot;; font-size: 24px; line-he=
ight: 1; text-rendering: optimizelegibility; display: inline-block; overflo=
w-wrap: normal; direction: ltr; font-feature-settings: &quot;liga&quot;;">=
=EE=90=89</span></span></span></div></div></div></div></div></div><div styl=
e=3D"overflow-y: auto; outline: none;"><div style=3D"align-items: baseline;=
 display: flex; flex-flow: row; justify-content: space-between;"><div style=
=3D"align-items: baseline; display: flex; flex-flow: row wrap; justify-cont=
ent: flex-start; min-width: 0px;"><div style=3D"align-items: baseline; disp=
lay: flex; flex-flow: row nowrap; justify-content: flex-start; padding: 16p=
x 16px 16px 0px;"><span style=3D"display: inline-block; justify-content: sp=
ace-between; padding: 0px; top: 0px; z-index: 1; font-family: &quot;Google =
Sans&quot;, Roboto, Arial, sans-serif; font-size: 22px; line-height: 28px; =
color: rgb(32, 33, 36); margin: 0px; outline: none; word-break: break-word;=
">4</span></div><div style=3D"color: rgb(95, 99, 104); display: inline-bloc=
k;"><br /></div></div><div style=3D"align-self: center; align-items: center=
; display: flex; justify-content: flex-start;"><div role=3D"button" tabinde=
x=3D"0" style=3D"user-select: none; transition: background 0.2s ease 0.1s; =
border: 0px; border-radius: 4px; color: rgb(95, 99, 104); cursor: pointer; =
display: inline-block; font-family: &quot;Google Sans&quot;, Roboto, Arial,=
 sans-serif; letter-spacing: 0.25px; line-height: 36px; min-width: auto; ou=
tline: none; overflow: hidden; position: relative; text-align: center; z-in=
dex: 0; left: -99em; height: 1px;"><div style=3D"transform: translate(-50%,=
 -50%) scale(0); transition: opacity 0.2s ease 0s, visibility 0s ease 0.2s,=
 transform 0s ease 0.2s, -webkit-transform 0s ease 0.2s; background-size: c=
over; left: 0px; opacity: 0; pointer-events: none; position: absolute; top:=
 0px; visibility: hidden; background-image: radial-gradient(circle farthest=
-side, rgba(0, 0, 0, 0.12), rgba(0, 0, 0, 0.12) 80%, rgba(0, 0, 0, 0) 100%)=
;"></div><div style=3D"position: absolute; top: 0px; right: 0px; bottom: 0p=
x; left: 0px; background-color: rgb(95, 99, 104); opacity: 0;"></div><span =
style=3D"align-items: center; display: flex; position: relative; padding: 0=
px 8px;"><span style=3D"display: inline-block; margin: 0px;">Skip to first =
unread message</span></span></div><div><div role=3D"button" aria-label=3D"C=
ollapse all" tabindex=3D"0" style=3D"user-select: none; transition: backgro=
und 0.3s ease 0s; border: 0px; border-radius: 50%; cursor: pointer; display=
: inline-block; flex-shrink: 0; height: 48px; outline: none; overflow: hidd=
en; position: relative; text-align: center; width: 48px; z-index: 0; color:=
 rgb(95, 99, 104); fill: rgb(95, 99, 104);"><div style=3D"transform: transl=
ate(-50%, -50%) scale(0); transition: opacity 0.2s ease 0s, visibility 0s e=
ase 0.2s, transform 0s ease 0.2s, -webkit-transform 0s ease 0.2s; backgroun=
d-size: cover; left: 0px; opacity: 0; pointer-events: none; position: absol=
ute; top: 0px; visibility: hidden; background-image: radial-gradient(circle=
 farthest-side, rgba(95, 99, 104, 0.16), rgba(95, 99, 104, 0.16) 80%, rgba(=
95, 99, 104, 0) 100%);"></div><span style=3D"align-items: center; display: =
flex; height: 48px; justify-content: center; position: relative; width: 48p=
x;"><span style=3D"display: flex; position: relative;"><span aria-hidden=3D=
"true" style=3D"font-family: &quot;Material Icons Extended&quot;; font-size=
: 20px; line-height: 1; text-rendering: optimizelegibility; display: inline=
-block; overflow-wrap: normal; direction: ltr; font-feature-settings: &quot=
;liga&quot;;">=EE=A5=84</span></span></span></div></div></div></div><div ro=
le=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART problem + p=
etalinux 2017.4"><span tabindex=3D"0" role=3D"listitem" aria-expanded=3D"tr=
ue" style=3D"border-bottom: 1px solid rgb(232, 234, 237); padding-top: 8px;=
 padding-left: 0px; border-left: 2px solid rgb(77, 144, 240);"><div tabinde=
x=3D"-1" style=3D"outline: none;"><div style=3D"display: flex;"><div style=
=3D"flex-grow: 1; min-width: 0px;"><div><div style=3D"align-items: center; =
color: rgb(95, 99, 104); display: flex; height: 48px; justify-content: spac=
e-between;"><span style=3D"clip: rect(1px, 1px, 1px, 1px); height: 1px; mar=
gin: 0px; overflow: hidden; padding: 0px; position: absolute; white-space: =
nowrap; width: 1px; z-index: -1000;">unread,</span><div style=3D"font-famil=
y: Roboto, Arial, sans-serif; font-size: 12px; letter-spacing: 0.3px; line-=
height: 16px; align-items: center; display: flex;">Jun 27, 2018, 5:33:04=E2=
=80=AFPM<span style=3D"font-family: &quot;Material Icons Extended&quot;; fo=
nt-size: 20px; letter-spacing: normal; text-align: center;">=EE=97=94</span=
></div></div></div><div role=3D"region" aria-labelledby=3D"c14597" style=3D=
"margin: 12px 0px; overflow: auto; padding-right: 20px;">https://t.me/motio=
nking_caliweed_psychedelics<br /><p>i'm trying to make jailhouse work on my=
 ZCU102 v1.0 (production)<br />using petalinux 2017.4 following this docume=
ntation :</p><p>https://t.me/motionking_caliweed_psychedelics<br /></p><p><=
br />the second uart doesn't work. After a question on the Xilinx forum</p>=
<p>https://t.me/motionking_caliweed_psychedelics<br /></p><p>i can activate=
 /dev/ttyPS1 on the zcu102 and verify it using</p><p>echo hello &gt; /dev/t=
tyPS1</p><p>but i still can't use it with jailhouse.</p><p><br />i have che=
cked with the gic-demo and linux-demo without any success.<br />i can use t=
he debug console with gic-demo, but that's all.</p><p>this command should w=
ork, but it doesn't :</p><p>jailhouse cell linux zynqmp-zcu102-linux-demo.c=
ell Image -d inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,1=
15200"</p><p><br />in the zynqmp-zcu102-linux-demo.c file, the uart address=
 is correct :</p><p>.mem_regions =3D {<br />/* UART */ {<br />.phys_start =
=3D 0xff010000,<br />.virt_start =3D 0xff010000,<br />.size =3D 0x1000,<br =
/>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br />JAILHOUSE_MEM_=
IO | JAILHOUSE_MEM_ROOTSHARED</p></div></div></div></div></span></div></div=
>https://t.me/motionking_caliweed_psychedelics<br /><div class=3D"gmail_quo=
te"><div dir=3D"auto" class=3D"gmail_attr">On Saturday, June 1, 2024 at 9:2=
6:29=E2=80=AFAM UTC+1 Dwayne Mickey wrote:<br/></div><blockquote class=3D"g=
mail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 2=
04, 204); padding-left: 1ex;">Penis Envy magic mushrooms are three times mo=
re potent than other mushrooms.  The effects of Penis Envy magic mushrooms =
may come on quickly due to higher levels of psilocin than psilocybin.<div>A=
bout Penis Envy</div><div>Penis Envy magic mushrooms can impact you differe=
ntly based upon a variety of factors, like your size, weight, your state of=
 health, whether you have taken them before, the amount you take, and more.=
  The setting in which you are taking them and who you are with are critica=
l factors.  Being in nature, in a safe, calm and tranquil setting, with no =
pending pressures or obligations is ideal for the user.=C2=A0</div><div><br=
></div><div>Trip Level 0: Microdosing</div><div>Recommended dosage: 0.2 =E2=
=80=93 0.5 g. dried mushrooms =E2=80=93 A micro-dose is a sub-perceptual am=
ount of mushrooms. Take this every 2-3 days to boost creativity or feel les=
s anxious. Microdosing trip levels capsules. Added as level 0, it=E2=80=99s=
 meant to be taken along with your day-to-day routine.</div><div>Trip Level=
 1: Happy go lucky</div><div>Recommended dosage: 0.8 =E2=80=93 1 g. dried m=
ushrooms =E2=80=93 The effects are mild and similar to being high on weed. =
Music starts to feel better, strangers seem more friendly and the mind is a=
ble to lose some control. You could have mild visual enhancements or some s=
ound distortion, but these will be subtle.</div><div>Trip Level 2: Beginner=
=E2=80=99s paradise</div><div>Recommended dosage: 1 =E2=80=93 1.5 g. dried =
mushrooms =E2=80=93 Consistent sensorial accentuation, colors becoming brig=
hter and a light body high. Level 2 can be a more intense form of Trip Leve=
l 1, but with the right dosage it can be something more. Be prepared for th=
e beginnings of visual and auditory hallucinations: objects moving and comi=
ng to life along with geometrical forms when you close your eyes. It will b=
e harder to concentrate and communicate and you will notice an increase in =
creativity along with an enhanced sensation, lightness and euphoria.</div><=
div>Trip Level 3: Classic psychedelic trip</div><div>Recommended dosage: 1.=
5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Level 3 is great for beginn=
ers who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic experience, =
without overdoing the dosage. This level is where visual hallucinations alo=
ng with the appearance of patterns and fractals will be evident. No more hi=
nting or subtle flashes of visuals, it=E2=80=99s happening for real. The su=
rface of the object you=E2=80=99re observing will become shiny and moving, =
as your field of depth is altered. Distortions in the aptitude to measure t=
he passage of time, might cause an 1 hour to feel like an eternity.</div><d=
iv>Level 4: Flying with the stars https:<a href=3D"http://t.me/Ricko_swavy8=
" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Den&amp;q=3Dhttp://t.me/Ricko_swavy8&amp;source=3Dgmail&am=
p;ust=3D1717470082902000&amp;usg=3DAOvVaw0kA4FW-SQFaSC4l8hRZIN2">t.me/Ricko=
_swavy8</a></div><div>Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =
=E2=80=93 Strong hallucinations take over: a psychedelic flood of shapes, c=
ontours and colors will blend together and hit the shores of your conscious=
ness. There=E2=80=99s no stopping the waves in Level 4. There will be some =
moments when you will lose touch reality. Random, non-existent objects will=
 appear and the concept of time will fade away to the background. Intriguin=
g to some, scary to others, this is the level where psychedelics can really=
 be powerful, life-altering and mind expanding. Keep in mind that this dosa=
ge is only recommend for experience users.</div><div>Level 5</div><div>:htt=
ps:<a href=3D"http://t.me/Ricko_swavy8" target=3D"_blank" rel=3D"nofollow" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp://t=
.me/Ricko_swavy8&amp;source=3Dgmail&amp;ust=3D1717470082902000&amp;usg=3DAO=
vVaw0kA4FW-SQFaSC4l8hRZIN2">t.me/Ricko_swavy8</a><br><br></div><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, June 2=
8, 2018 at 12:49:45=E2=80=AFPM UTC+1 <a href data-email-masked rel=3D"nofol=
low">christophe...@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">hi all,<p>now i can see the output of the console and mon=
itor the linux boot.<br>And of course, linux doesn&#39;t boot and stop with=
 a kernel panic : <p>[    9.148409] NET: Registered protocol family 1<br>[ =
   9.200596] RPC: Registered named UNIX socket transport module.<br>[    9.=
271265] RPC: Registered udp transport module.<br>[    9.327501] RPC: Regist=
ered tcp transport module.<br>[    9.383752] RPC: Registered tcp NFSv4.1 ba=
ckchannel transport module.<br>[    9.814860] Kernel panic - not syncing: w=
rite error<br>[    9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.=
0-xilinx-v2017.4 #2<br>[    9.957622] Hardware name: Jailhouse cell on Zynq=
MP ZCU102 (DT)<br>[   10.028458] Call trace:<br>[   10.057635] [&lt;ffffff8=
008088138&gt;] dump_backtrace+0x0/0x198<br>[   10.122215] [&lt;ffffff800808=
82e4&gt;] show_stack+0x14/0x20<br>[   10.182634] [&lt;ffffff80083de594&gt;]=
 dump_stack+0x94/0xb8<br>[   10.243054] [&lt;ffffff800812e9f8&gt;] panic+0x=
114/0x25c<br>[   10.300347] [&lt;ffffff8008cc2d8c&gt;] populate_rootfs+0x40=
/0x110<br>[   10.367014] [&lt;ffffff80080830b8&gt;] do_one_initcall+0x38/0x=
128<br>[   10.433683] [&lt;ffffff8008cc0c94&gt;] kernel_init_freeable+0x140=
/0x1e0<br>[   10.506604] [&lt;ffffff80089494e0&gt;] kernel_init+0x10/0x100<=
br>[   10.569104] [&lt;ffffff8008082e80&gt;] ret_from_fork+0x10/0x50<br>[  =
 10.632647] SMP: stopping secondary CPUs<br>[   10.679537] ---[ end Kernel =
panic - not syncing: write error<p>i can see a write error, but i don&#39;t=
 know why.<br>i have attached the boot log file.<p>Any hints ?<p>Regards <b=
r>C.Alexandre </p></p></p></p></p></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5ac62ff7-670a-40a2-9271-700b1f8d7f86n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5ac62ff7-670a-40a2-9271-700b1f8d7f86n%40googlegroups.co=
m</a>.<br />

------=_Part_114613_989140744.1717384002878--

------=_Part_114612_1084070541.1717384002878--
