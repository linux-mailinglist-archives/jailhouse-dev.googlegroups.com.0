Return-Path: <jailhouse-dev+bncBDJ5VLND4MLRBNVW5OZAMGQEHIOHLCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 045188D6EDE
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Jun 2024 10:26:32 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dfa84f6a603sf885707276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Jun 2024 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717230391; x=1717835191; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ielmu99nWcSQnEq8XEcwyn0kfw1Jyo5n2l8ZKk6vh48=;
        b=PmhKzcxpyhkWp597+80EzrKwYz246SDg8uzvQwOasy7t4pDVhxNnepe4HmCnajF1d+
         6qoDtX4nqljrbKzvjWDgfPyxjr+g+J+nvkBZHsoZI7hHkHXUunds4710rj47VbGvzSSy
         BcU1hTJifTvynsAls3Z2RQm6CrlB8/SbuYj+nQoS0kqTFJTk6gtAETXRvqn0Jv/6qzmF
         ZeGXDuY+wyO+N5hms909BGOnB/sgslpKMGZ1Sk9m9h208m2rU1OT28d+PkQhTjeyXSmk
         2iHFy3S6C3VhW4wwyA2OvAby3f8n9qywXuD5Lnbbn1krbjAVlbex57C2QODu7mBB9aJE
         RimA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717230391; x=1717835191; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ielmu99nWcSQnEq8XEcwyn0kfw1Jyo5n2l8ZKk6vh48=;
        b=Wk0S9RBNAY+19Ls/wp01BCVbaflQLoppFyZft26b5MVtOyeJ4byM5byC+2fjQ+xSbM
         ZcsMy38mejgHZHxtLhztEc/j7kLMCKOcDAz16Cc9zCDiEGmL4u8iEnZUWJv4vaUg/M+S
         wYX0GEh4/TGes1hDIzziWHbbMXrKPiwnpr6MKTdD4VD3jHyhHL4DalbCfEUzD1iVJDeQ
         oAY75TUbAxdD18tkqZD5VHJWd3qzHDj/OBEmKPgpznmaIIDvlN6DKKDx1fPueXPj/4Xs
         k7FTHscX5W2ejRb0YkpvwE1IuuWbiGvP6n2uHPXmgDKOYCc+0gGbXe/R8tN6IFlwPVkO
         Ujtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717230391; x=1717835191;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ielmu99nWcSQnEq8XEcwyn0kfw1Jyo5n2l8ZKk6vh48=;
        b=QXykzIGZ6yMNHDO2J5Yv7cCGCkd9+vQXM/SsE0ae3m/G8/l2yxKZOJL2gR9qrH0JIO
         AJ2Spj4dTp6g29G+ncth+eh8tkdUSopf2qFaxWJLmncNa1bmv7oIfSLy5XHXF3xNZlMh
         ab1N2oZik9kl8TMipjQrt2+C538AHUtSlErdZIfYKVJLBOZzHZq7RhOrVgR4aDO5pfJK
         jZCpMjrM13OOQJDeqALE5/o23JO3FESpm3Bp+NUY/uzomrCC4XpM6nO8NI/uvk9yJ420
         Ny47RuePYBa13kBjtshcJu7AEt58sYiq87U81eAfWwkHzVaQ1V4duiAAFcqvXgEkQqpP
         4kVQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUmjOTe/SFSRLjkcsTeBUNIWD0Pk5bm38VBj0z9KqEw7odTIlt9bEVilWYrk0ZD6FMACdK7VeRgQ6Eth9cl+c3JvvoEYtaAeB3WGbA=
X-Gm-Message-State: AOJu0YyWLQGmVrdYGdfheng2KVEQTE3vdnOtQBqs2O6OBABIeYn7iBvt
	hHZawIz05J7/2zJ9djRJlNMuv+WkvX4S+nMkARDgEL6DPhRQMeQs
X-Google-Smtp-Source: AGHT+IEIGlM5N38RCEYUccL3O9kGVkqOAyCYtfgePme+l3E9UEQI0KJ/sdNYIl00CUfJNasu/iMCGg==
X-Received: by 2002:a25:bc85:0:b0:dee:6525:7424 with SMTP id 3f1490d57ef6-dfa73c13b4dmr3863994276.25.1717230391623;
        Sat, 01 Jun 2024 01:26:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8e08:0:b0:df4:dad1:987f with SMTP id 3f1490d57ef6-dfa59ad44d5ls570060276.1.-pod-prod-09-us;
 Sat, 01 Jun 2024 01:26:30 -0700 (PDT)
X-Received: by 2002:a05:6902:18d4:b0:dfa:6e39:95c6 with SMTP id 3f1490d57ef6-dfa73e312ccmr1009501276.8.1717230390066;
        Sat, 01 Jun 2024 01:26:30 -0700 (PDT)
Date: Sat, 1 Jun 2024 01:26:28 -0700 (PDT)
From: Dwayne Mickey <dwnmickey@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <aa79214c-06f5-482d-9b3a-18cdfd9a1909n@googlegroups.com>
In-Reply-To: <b233e3c5-c126-4ff1-a109-8d2862e939ee@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
 <b233e3c5-c126-4ff1-a109-8d2862e939ee@googlegroups.com>
Subject: Re: jailhouse + ZCU102 V1.0 + second UART problem + petalinux
 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_269470_967507538.1717230388868"
X-Original-Sender: dwnmickey@gmail.com
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

------=_Part_269470_967507538.1717230388868
Content-Type: multipart/alternative; 
	boundary="----=_Part_269471_2005836325.1717230388868"

------=_Part_269471_2005836325.1717230388868
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
Level 4: Flying with the stars https:t.me/Ricko_swavy8
Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong hallu=
cinations take=20
over: a psychedelic flood of shapes, contours and colors will blend=20
together and hit the shores of your consciousness. There=E2=80=99s no stopp=
ing the=20
waves in Level 4. There will be some moments when you will lose touch=20
reality. Random, non-existent objects will appear and the concept of time=
=20
will fade away to the background. Intriguing to some, scary to others, this=
=20
is the level where psychedelics can really be powerful, life-altering and=
=20
mind expanding. Keep in mind that this dosage is only recommend for=20
experience users.
Level 5
:https:t.me/Ricko_swavy8

On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1 christophe...@gmail=
.com=20
wrote:

> hi all,
>
> now i can see the output of the console and monitor the linux boot.
> And of course, linux doesn't boot and stop with a kernel panic :=20
>
> [ 9.148409] NET: Registered protocol family 1
> [ 9.200596] RPC: Registered named UNIX socket transport module.
> [ 9.271265] RPC: Registered udp transport module.
> [ 9.327501] RPC: Registered tcp transport module.
> [ 9.383752] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [ 9.814860] Kernel panic - not syncing: write error
> [ 9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-xilinx-v2017.=
4=20
> #2
> [ 9.957622] Hardware name: Jailhouse cell on ZynqMP ZCU102 (DT)
> [ 10.028458] Call trace:
> [ 10.057635] [<ffffff8008088138>] dump_backtrace+0x0/0x198
> [ 10.122215] [<ffffff80080882e4>] show_stack+0x14/0x20
> [ 10.182634] [<ffffff80083de594>] dump_stack+0x94/0xb8
> [ 10.243054] [<ffffff800812e9f8>] panic+0x114/0x25c
> [ 10.300347] [<ffffff8008cc2d8c>] populate_rootfs+0x40/0x110
> [ 10.367014] [<ffffff80080830b8>] do_one_initcall+0x38/0x128
> [ 10.433683] [<ffffff8008cc0c94>] kernel_init_freeable+0x140/0x1e0
> [ 10.506604] [<ffffff80089494e0>] kernel_init+0x10/0x100
> [ 10.569104] [<ffffff8008082e80>] ret_from_fork+0x10/0x50
> [ 10.632647] SMP: stopping secondary CPUs
> [ 10.679537] ---[ end Kernel panic - not syncing: write error
>
> i can see a write error, but i don't know why.
> i have attached the boot log file.
>
> Any hints ?
>
> Regards=20
> C.Alexandre=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/aa79214c-06f5-482d-9b3a-18cdfd9a1909n%40googlegroups.com.

------=_Part_269471_2005836325.1717230388868
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Penis Envy magic mushrooms are three times more potent than other mushrooms=
.  The effects of Penis Envy magic mushrooms may come on quickly due to hig=
her levels of psilocin than psilocybin.<div>About Penis Envy</div><div>Peni=
s Envy magic mushrooms can impact you differently based upon a variety of f=
actors, like your size, weight, your state of health, whether you have take=
n them before, the amount you take, and more.  The setting in which you are=
 taking them and who you are with are critical factors.  Being in nature, i=
n a safe, calm and tranquil setting, with no pending pressures or obligatio=
ns is ideal for the user.=C2=A0</div><div><br /></div><div>Trip Level 0: Mi=
crodosing</div><div>Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushroom=
s =E2=80=93 A micro-dose is a sub-perceptual amount of mushrooms. Take this=
 every 2-3 days to boost creativity or feel less anxious. Microdosing trip =
levels capsules. Added as level 0, it=E2=80=99s meant to be taken along wit=
h your day-to-day routine.</div><div>Trip Level 1: Happy go lucky</div><div=
>Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effec=
ts are mild and similar to being high on weed. Music starts to feel better,=
 strangers seem more friendly and the mind is able to lose some control. Yo=
u could have mild visual enhancements or some sound distortion, but these w=
ill be subtle.</div><div>Trip Level 2: Beginner=E2=80=99s paradise</div><di=
v>Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consiste=
nt sensorial accentuation, colors becoming brighter and a light body high. =
Level 2 can be a more intense form of Trip Level 1, but with the right dosa=
ge it can be something more. Be prepared for the beginnings of visual and a=
uditory hallucinations: objects moving and coming to life along with geomet=
rical forms when you close your eyes. It will be harder to concentrate and =
communicate and you will notice an increase in creativity along with an enh=
anced sensation, lightness and euphoria.</div><div>Trip Level 3: Classic ps=
ychedelic trip</div><div>Recommended dosage: 1.5 =E2=80=93 3 g. dried mushr=
ooms =E2=80=93 Trip Level 3 is great for beginners who want to jump in the =
=E2=80=9Creal=E2=80=9D psychedelic experience, without overdoing the dosage=
. This level is where visual hallucinations along with the appearance of pa=
tterns and fractals will be evident. No more hinting or subtle flashes of v=
isuals, it=E2=80=99s happening for real. The surface of the object you=E2=
=80=99re observing will become shiny and moving, as your field of depth is =
altered. Distortions in the aptitude to measure the passage of time, might =
cause an 1 hour to feel like an eternity.</div><div>Level 4: Flying with th=
e stars https:t.me/Ricko_swavy8</div><div>Recommended dosage: 3 =E2=80=93 4=
 g. dried mushrooms =E2=80=93 Strong hallucinations take over: a psychedeli=
c flood of shapes, contours and colors will blend together and hit the shor=
es of your consciousness. There=E2=80=99s no stopping the waves in Level 4.=
 There will be some moments when you will lose touch reality. Random, non-e=
xistent objects will appear and the concept of time will fade away to the b=
ackground. Intriguing to some, scary to others, this is the level where psy=
chedelics can really be powerful, life-altering and mind expanding. Keep in=
 mind that this dosage is only recommend for experience users.</div><div>Le=
vel 5</div><div>:https:t.me/Ricko_swavy8<br /><br /></div><div class=3D"gma=
il_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, June 28, 2018=
 at 12:49:45=E2=80=AFPM UTC+1 christophe...@gmail.com wrote:<br/></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;">hi all,<p>now i can see the=
 output of the console and monitor the linux boot.<br>And of course, linux =
doesn&#39;t boot and stop with a kernel panic : <p>[    9.148409] NET: Regi=
stered protocol family 1<br>[    9.200596] RPC: Registered named UNIX socke=
t transport module.<br>[    9.271265] RPC: Registered udp transport module.=
<br>[    9.327501] RPC: Registered tcp transport module.<br>[    9.383752] =
RPC: Registered tcp NFSv4.1 backchannel transport module.<br>[    9.814860]=
 Kernel panic - not syncing: write error<br>[    9.872207] CPU: 0 PID: 1 Co=
mm: swapper/0 Not tainted 4.9.0-xilinx-v2017.4 #2<br>[    9.957622] Hardwar=
e name: Jailhouse cell on ZynqMP ZCU102 (DT)<br>[   10.028458] Call trace:<=
br>[   10.057635] [&lt;ffffff8008088138&gt;] dump_backtrace+0x0/0x198<br>[ =
  10.122215] [&lt;ffffff80080882e4&gt;] show_stack+0x14/0x20<br>[   10.1826=
34] [&lt;ffffff80083de594&gt;] dump_stack+0x94/0xb8<br>[   10.243054] [&lt;=
ffffff800812e9f8&gt;] panic+0x114/0x25c<br>[   10.300347] [&lt;ffffff8008cc=
2d8c&gt;] populate_rootfs+0x40/0x110<br>[   10.367014] [&lt;ffffff80080830b=
8&gt;] do_one_initcall+0x38/0x128<br>[   10.433683] [&lt;ffffff8008cc0c94&g=
t;] kernel_init_freeable+0x140/0x1e0<br>[   10.506604] [&lt;ffffff80089494e=
0&gt;] kernel_init+0x10/0x100<br>[   10.569104] [&lt;ffffff8008082e80&gt;] =
ret_from_fork+0x10/0x50<br>[   10.632647] SMP: stopping secondary CPUs<br>[=
   10.679537] ---[ end Kernel panic - not syncing: write error<p>i can see =
a write error, but i don&#39;t know why.<br>i have attached the boot log fi=
le.<p>Any hints ?<p>Regards <br>C.Alexandre </p></p></p></p></p></blockquot=
e></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/aa79214c-06f5-482d-9b3a-18cdfd9a1909n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/aa79214c-06f5-482d-9b3a-18cdfd9a1909n%40googlegroups.co=
m</a>.<br />

------=_Part_269471_2005836325.1717230388868--

------=_Part_269470_967507538.1717230388868--
