Return-Path: <jailhouse-dev+bncBDDYHZXV2EIRBU7UXOVQMGQEAMTHYXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3d.google.com (mail-oo1-xc3d.google.com [IPv6:2607:f8b0:4864:20::c3d])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FC5805026
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Dec 2023 11:24:20 +0100 (CET)
Received: by mail-oo1-xc3d.google.com with SMTP id 006d021491bc7-58d5bb052dfsf7168858eaf.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Dec 2023 02:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701771859; x=1702376659; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg0GK5fgggRwrpvMeDGsBioYf2c7V9bj8NOg3tepwek=;
        b=pwqV1O6jZmBA6YHZnb3eh7NQWMHCedclx/6y1xjnA0cq5cPV80MJTYzCITKQ2/1dkF
         127cn+g67g1RvDozlQOiYEw0nlICnK9afYy9N+9zIgdtAE0S2p9wPYMtZ9dZk8YqZcWM
         6P4SifJhgUmAXyHV10OMTE/6oZwyD9iCHiRA4JOy8C2GLjMyNwZiaW8OnXE68IwipwUX
         +nA5E4sgxkuMn+orRzNdwdA9SoXHugoB5zAPve79YKmN5MMd5EO7EBZUhssOwRpndIE0
         GQiLwPPB/rqNsB4nSwXqYUUPPvR8vGeSRzQ50NKFlToyw7y2PA08jSQBupv/RVqAyzRb
         Dl5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701771859; x=1702376659; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pg0GK5fgggRwrpvMeDGsBioYf2c7V9bj8NOg3tepwek=;
        b=MB4qXyMDLTomZGhsfrdFP9W+EMzAp5X/KmULaBtFOg4StZGI5PHGlkAk/RQA6a5I7W
         5ecTgOO+oihqfkSNPl+YZCIi+wFE0zyuEEcgu7ru25Pl7X79rmQGXMNNjPG/lHdUrCt7
         iFz6AnbamaDy45W80Efbopz7VlkUuS+5IziJTBbKwoQJbnwLrn57Cgcb+NOvk8eXjkdB
         Xb7h/kLNfNYH/VHQmVe2vCXbi+V8RHAaN094T90uI74YrOHqHbwnG2BPt8RzYNIIu3HE
         vKVsICgCa0qkWG4YeUIr0sSb8LtznUnH6CV68zRtLtkW2FPREZqJT7XTnGjdNytj6VKy
         hCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701771859; x=1702376659;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg0GK5fgggRwrpvMeDGsBioYf2c7V9bj8NOg3tepwek=;
        b=EhNLSHZO78mRB6cGLkJPRx1cNKEvSXhler7pVjouiV8w+YRSen5BFbrnK2WGUmnVuF
         m1vr4gikQMLbqw/pM6bsfvm6QpikpIOK+52TAuopyESxe7DWiyiJSWq6q/hljxBgjJSQ
         KEDc4P/1kb3RrS/V3ZcvM43UY/gnIbFyPczvcvoLJIXc9coJkDrilxW3hEQMYe3mKJEB
         s2gCLR0+l2CDkrJw6O1jHjKF3KzpPW19crXgUwd7SfLrjF3Oxgx5k9DB41R8RZlmlri8
         UuBM7lSPJmEsTBCWrkJK62ULhOXlsaU0yLk2jkjfU1zzQzGPrks3WaqSMHnPy63UaH/k
         XyoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwTi9ZTbTb9ED1CevwFKGM/xqC1ea32YaTMaew6jO8NPhsuOt7c
	Pklun9fQvYTZjCFCuAcSIrQ=
X-Google-Smtp-Source: AGHT+IGay6SEob7Y4efRWlaBMLD1fbZIRE+pVWyonZHT6zgkaA/ZVnoodkmLom+NGgXVpfclYmFVzg==
X-Received: by 2002:a4a:ca8b:0:b0:58e:1c48:39a6 with SMTP id x11-20020a4aca8b000000b0058e1c4839a6mr4864896ooq.12.1701771859780;
        Tue, 05 Dec 2023 02:24:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6820:1c92:b0:58d:5ec9:ea68 with SMTP id
 ct18-20020a0568201c9200b0058d5ec9ea68ls317126oob.1.-pod-prod-07-us; Tue, 05
 Dec 2023 02:24:19 -0800 (PST)
X-Received: by 2002:a05:6808:3594:b0:3b8:5bec:3d8e with SMTP id cp20-20020a056808359400b003b85bec3d8emr2738092oib.3.1701771858912;
        Tue, 05 Dec 2023 02:24:18 -0800 (PST)
Date: Tue, 5 Dec 2023 02:24:18 -0800 (PST)
From: Kay Deleppo <kaydeleppo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <884680b5-6a14-49c3-a900-e96bbbbb3717n@googlegroups.com>
Subject: Telecharger Nero 6 Gratuit Avec Serial
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4586_726307475.1701771858373"
X-Original-Sender: kaydeleppo@gmail.com
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

------=_Part_4586_726307475.1701771858373
Content-Type: multipart/alternative; 
	boundary="----=_Part_4587_109536116.1701771858373"

------=_Part_4587_109536116.1701771858373
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Using warez version, crack, warez passwords, patches, serial numbers,=20
registration codes, key generator, pirate key, keymaker or keygen for*nero=
=20
6* license key is illegal. Download links are directly from our mirrors or=
=20
publisher's website,*nero 6* torrent files or shared files from free file=
=20
sharing and free upload services,including Rapidshare, MegaUpload,=20
YouSendIt, Letitbit, DropSend, MediaMax, HellShare, HotFile, FileServe,=20
LeapFile, MyOtherDrive or MediaFire,are not allowed!

Your computer will be at risk getting infected with spyware, adware,=20
viruses, worms, trojan horses, dialers, etcwhile you are searching and=20
browsing these illegal sites which distribute a so called keygen, key=20
generator, pirate key, serial number, warez full version or crack for*nero=
=20
6*. These infections might corrupt your computer installation or breach=20
your privacy.*nero 6* keygen or key generator might contain a trojan horse=
=20
opening a backdoor on your computer.
Telecharger Nero 6 Gratuit Avec Serial

*Download Zip* https://urlgoal.com/2wIlEg


Le produit dispose d'une aide int=C3=A9gr=C3=A9e avec des instructions d=C3=
=A9taill=C3=A9es sur=20
l'utilisation des fonctions. Il est possible d'utiliser le mode de=20
fonctionnement automatique. Pour les utilisateurs exp=C3=A9riment=C3=A9s, i=
l existe=20
un ensemble de fonctionnalit=C3=A9s suppl=C3=A9mentaires permettant de r=C3=
=A9soudre des=20
t=C3=A2ches plus complexes. Vous pouvez t=C3=A9l=C3=A9chargement gratuit Ne=
ro Express=20
officielle derni=C3=A8re version pour Windows 7 en Fran=C3=A7ais.


   1. nero 6.6.0.16 Nero Digital Plug-in
   2. Nero 6 Ultra Edition 6.6.0.5
   3. Nero 6.6.0.6
   4. Nero 6 Ultra Edition 6.6.0.15
   5. Smadav 8.6 Free -> Pro
   6. nero 6.6.0.1
   7. Nero-6.6.0.15a
   8. Nero 6.6.0.12 Enterprise/Ultra Edition
   9. Nero 6.6.0.16
   10. Nero 6.6.0.8a
   11. Nero 6.6.0.12 Enterprise
   12. Ahead Nero 6.6.0.15
   13. Nero 6.6.0.5 Ultra Edition
   14. Ahead Nero 6.6.0.16
   15. Nero 6.6.0.16 MPEG2/DVD Plug-in
   16. Ahead Nero 6.6.0.12 Reloaded Ultra
   17. Nero 6.6.0.12 Ultra
   18. Nero 6.6.0.16 Dolby Digital Plug-in
   19. Nero 6.6.0.5 Enterprise
   20. Nero 6.6.0.16 HE ACC Plug-in
   21. Nero 6.6.0.5 Enterprise Edition
   22. Nero 6.6.0.16 Multichannel Plugin
   23. Nero 6.6.0.16 MPEG2/SVCD Plug-in
   24. Nero 6 Express
   25. Nero 6 CD & DVD Creator
   26. Nero 6
   27. Nero 6.3.1.10
   28. Nero 6 CD & DVD Ultra Editon
   29. Nero 6.3.1.20
   30. Nero 6 Ultra Edition and Reloaded
   31. Nero 6 OEM Suite German
   32. Nero Burnig 6.6.0.6 Reloaded
   33. Ahead Nero Burning ROM 6.6.0.6
   34. Free Internet TV 4.6
   35. Avast free antivirus 6.0
   36. Nero Burning ROM Ultra Edition 6.6.0.6 Enterprise Edition
   37. Ahead Nero Buring Rom Ultra Edition 6.6.0.6
   38. Avast! Free Antivirus 6.0
   39. DVD Region Free + CSS 5.9.7.6
   40. DVD Region CSS Free 5.9.6.2
   41. Nero Burning ROM Ultra Edition 6.6.0.6
   42. Eusing Free Reg Cleaner 2.6 by iLgiNcH=20
   43. Avast free anti-virus 6
   44. Ahead Nero Burning Rom 6.6.0.12
   45. Ahead Nero Burning ROM 6.6.0.8
   46. Ahead Nero Burning ROM 6.6.0.18
   47. Ahead Nero Burning ROM 6.6.0.16
   48. Nero Burning Rom 6.6.1.15c
   49. Nero Reloaded 6.6.0.12
   50. Ahead Nero Dolby Digital (5.1) Plug-In 6.6.0.8
   51. Nero Burning ROM 6.6.0.16
   52. Ahead Nero Burning ROM 6.6.0.12
   53. Nero Burning ROM Ultra Edition 6.6.0.8a
   54. Ahead Nero Burning ROM 6.6.0.15a
   55. Ahead Nero Burning ROM 6.6.0.14
   56. Ahead Nero BurningRom 6.6.0.12 Ultra Edition
   57. Ahead Nero BurningRom 6.6.0.12 Enterprised Edition
   58. Ahead Nero Burning ROM 6.6.0.8a
   59. Ahead Nero Burning Rom 6.6.0.15
   60. Nero Reloaded Ultra Edition 6.6.0.3
   61. Nero Dolby Digital (5.19 Plug-In 6.6.0.8
   62. Ahead Nero HE-AAC Plug-in 6.6.0.8
   63. Ahead Nero Burning Rom 6.6.0.14 Ultra Edition
   64. Ahead Nero Burning Room Enterprise Edition 6.6.0.8
   65. Ahead Nero Burning Rom Ultra Edition 6.6.0.5
   66. Nero Burning ROM 6.6.0.8
   67. Ahead Nero Burning ROM 6.6.0.5
   68. Nero Burning Rom 6.6.0.7
   69. Ahead Nero Burning Rom 6.6.0.13
   70. Ahead Nero Burning Rom 6.6.0.1x
   71. Nero Burning ROM Enterprise Edition 6.6.0.5
   72. Nero Ultra Edition 6.6.0.14
   73. Ahead Nero Burning Rom v 6.6.0.13
   74. Nero Ver. 6.6.0.14D
   75. AAheadheadAhead Nero Burning Rom 6.6.0.13
   76. Nero Burning Rom 10.6.10600
   77. Nero 8.3.6.0 Ultra Edtion
   78. Nero 9 9.2.6.0 Full
   79. Nero 8.3.6.0
   80. Nero 8.3.6.0 ultra edition
   81. Nero-10.6.11300
   82. Nero Multimedia Suite 10.6.11300
   83. Nero Multimedia Suite Platinum HD 10.6.11800
   84. Nero 7.9.6.0 Serial
   85. Nero-8.3.6.0 deu_trial
   86. Nero lite 9.2.6
   87. Nero 7.9.6.0
   88. Ahead Nero 8.3.6.0
   89. Nero 7 Ultra Edition ENHANCED 7.9.6.0
   90. Nero Ultra v 7.9.6.0
   91. Nero 9.2.6.0 all serials
   92. Nero burning rom 9 9.2.6.0
   93. Nero Burning ROM 10.6.1
   94. Ahead Nero 7.9.6.0 Ultra Edition
   95. Nero Multimedia Suite Platinum HD 10.6.11300
   96. Nero 9 9.2.0.6
   97. Ahead Nero v8.3.6.0
   98. Nero PlatinumHD-10.6.11800
   99. Ahead Nero 7.9.6.0 Premium
   100. Nero 9.2.6.0 HD Ultra Edition (from Trial-Version)

eebf2c3492

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/884680b5-6a14-49c3-a900-e96bbbbb3717n%40googlegroups.com.

------=_Part_4587_109536116.1701771858373
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p>Using warez version, crack, warez passwords, patches, serial number=
s, registration codes, key generator, pirate key, keymaker or keygen for<st=
rong>nero 6</strong> license key is illegal. Download links are directly fr=
om our mirrors or publisher's website,<strong>nero 6</strong> torrent files=
 or shared files from free file sharing and free upload services,including =
Rapidshare, MegaUpload, YouSendIt, Letitbit, DropSend, MediaMax, HellShare,=
 HotFile, FileServe, LeapFile, MyOtherDrive or MediaFire,are not allowed!</=
p></div><div><p>Your computer will be at risk getting infected with spyware=
, adware, viruses, worms, trojan horses, dialers, etcwhile you are searchin=
g and browsing these illegal sites which distribute a so called keygen, key=
 generator, pirate key, serial number, warez full version or crack for<stro=
ng>nero 6</strong>. These infections might corrupt your computer installati=
on or breach your privacy.<strong>nero 6</strong> keygen or key generator m=
ight contain a trojan horse opening a backdoor on your computer.</p></div><=
div></div><div><h2>Telecharger Nero 6 Gratuit Avec Serial</h2><br /><p><b>D=
ownload Zip</b> https://urlgoal.com/2wIlEg</p><br /><br /></div><div><p>Le =
produit dispose d'une aide int=C3=A9gr=C3=A9e avec des instructions d=C3=A9=
taill=C3=A9es sur l'utilisation des fonctions. Il est possible d'utiliser l=
e mode de fonctionnement automatique. Pour les utilisateurs exp=C3=A9riment=
=C3=A9s, il existe un ensemble de fonctionnalit=C3=A9s suppl=C3=A9mentaires=
 permettant de r=C3=A9soudre des t=C3=A2ches plus complexes. Vous pouvez t=
=C3=A9l=C3=A9chargement gratuit Nero Express officielle derni=C3=A8re versi=
on pour Windows 7 en Fran=C3=A7ais.</p></div><div><p><ol><li>nero 6.6.0.16 =
Nero Digital Plug-in</li><li>Nero 6 Ultra Edition 6.6.0.5</li><li>Nero 6.6.=
0.6</li><li>Nero 6 Ultra Edition 6.6.0.15</li><li>Smadav 8.6 Free -> Pro</l=
i><li>nero 6.6.0.1</li><li>Nero-6.6.0.15a</li><li>Nero 6.6.0.12 Enterprise/=
Ultra Edition</li><li>Nero 6.6.0.16</li><li>Nero 6.6.0.8a</li><li>Nero 6.6.=
0.12 Enterprise</li><li>Ahead Nero 6.6.0.15</li><li>Nero 6.6.0.5 Ultra Edit=
ion</li><li>Ahead Nero 6.6.0.16</li><li>Nero 6.6.0.16 MPEG2/DVD Plug-in</li=
><li>Ahead Nero 6.6.0.12 Reloaded Ultra</li><li>Nero 6.6.0.12 Ultra</li><li=
>Nero 6.6.0.16 Dolby Digital Plug-in</li><li>Nero 6.6.0.5 Enterprise</li><l=
i>Nero 6.6.0.16 HE ACC Plug-in</li><li>Nero 6.6.0.5 Enterprise Edition</li>=
<li>Nero 6.6.0.16 Multichannel Plugin</li><li>Nero 6.6.0.16 MPEG2/SVCD Plug=
-in</li><li>Nero 6 Express</li><li>Nero 6 CD & DVD Creator</li><li>Nero 6</=
li><li>Nero 6.3.1.10</li><li>Nero 6 CD & DVD Ultra Editon</li><li>Nero 6.3.=
1.20</li><li>Nero 6 Ultra Edition and Reloaded</li><li>Nero 6 OEM Suite Ger=
man</li><li>Nero Burnig 6.6.0.6 Reloaded</li><li>Ahead Nero Burning ROM 6.6=
.0.6</li><li>Free Internet TV 4.6</li><li>Avast free antivirus 6.0</li><li>=
Nero Burning ROM Ultra Edition 6.6.0.6 Enterprise Edition</li><li>Ahead Ner=
o Buring Rom Ultra Edition 6.6.0.6</li><li>Avast! Free Antivirus 6.0</li><l=
i>DVD Region Free + CSS 5.9.7.6</li><li>DVD Region CSS Free 5.9.6.2</li><li=
>Nero Burning ROM Ultra Edition 6.6.0.6</li><li>Eusing Free Reg Cleaner 2.6=
 by iLgiNcH </li><li>Avast free anti-virus 6</li><li>Ahead Nero Burning Rom=
 6.6.0.12</li><li>Ahead Nero Burning ROM 6.6.0.8</li><li>Ahead Nero Burning=
 ROM 6.6.0.18</li><li>Ahead Nero Burning ROM 6.6.0.16</li><li>Nero Burning =
Rom 6.6.1.15c</li><li>Nero Reloaded 6.6.0.12</li><li>Ahead Nero Dolby Digit=
al (5.1) Plug-In 6.6.0.8</li><li>Nero Burning ROM 6.6.0.16</li><li>Ahead Ne=
ro Burning ROM 6.6.0.12</li><li>Nero Burning ROM Ultra Edition 6.6.0.8a</li=
><li>Ahead Nero Burning ROM 6.6.0.15a</li><li>Ahead Nero Burning ROM 6.6.0.=
14</li><li>Ahead Nero BurningRom 6.6.0.12 Ultra Edition</li><li>Ahead Nero =
BurningRom 6.6.0.12 Enterprised Edition</li><li>Ahead Nero Burning ROM 6.6.=
0.8a</li><li>Ahead Nero Burning Rom 6.6.0.15</li><li>Nero Reloaded Ultra Ed=
ition 6.6.0.3</li><li>Nero Dolby Digital (5.19 Plug-In 6.6.0.8</li><li>Ahea=
d Nero HE-AAC Plug-in 6.6.0.8</li><li>Ahead Nero Burning Rom 6.6.0.14 Ultra=
 Edition</li><li>Ahead Nero Burning Room Enterprise Edition 6.6.0.8</li><li=
>Ahead Nero Burning Rom Ultra Edition 6.6.0.5</li><li>Nero Burning ROM 6.6.=
0.8</li><li>Ahead Nero Burning ROM 6.6.0.5</li><li>Nero Burning Rom 6.6.0.7=
</li><li>Ahead Nero Burning Rom 6.6.0.13</li><li>Ahead Nero Burning Rom 6.6=
.0.1x</li><li>Nero Burning ROM Enterprise Edition 6.6.0.5</li><li>Nero Ultr=
a Edition 6.6.0.14</li><li>Ahead Nero Burning Rom v 6.6.0.13</li><li>Nero V=
er. 6.6.0.14D</li><li>AAheadheadAhead Nero Burning Rom 6.6.0.13</li><li>Ner=
o Burning Rom 10.6.10600</li><li>Nero 8.3.6.0 Ultra Edtion</li><li>Nero 9 9=
.2.6.0 Full</li><li>Nero 8.3.6.0</li><li>Nero 8.3.6.0 ultra edition</li><li=
>Nero-10.6.11300</li><li>Nero Multimedia Suite 10.6.11300</li><li>Nero Mult=
imedia Suite Platinum HD 10.6.11800</li><li>Nero 7.9.6.0 Serial</li><li>Ner=
o-8.3.6.0 deu_trial</li><li>Nero lite 9.2.6</li><li>Nero 7.9.6.0</li><li>Ah=
ead Nero 8.3.6.0</li><li>Nero 7 Ultra Edition ENHANCED 7.9.6.0</li><li>Nero=
 Ultra v 7.9.6.0</li><li>Nero 9.2.6.0 all serials</li><li>Nero burning rom =
9 9.2.6.0</li><li>Nero Burning ROM 10.6.1</li><li>Ahead Nero 7.9.6.0 Ultra =
Edition</li><li>Nero Multimedia Suite Platinum HD 10.6.11300</li><li>Nero 9=
 9.2.0.6</li><li>Ahead Nero v8.3.6.0</li><li>Nero PlatinumHD-10.6.11800</li=
><li>Ahead Nero 7.9.6.0 Premium</li><li>Nero 9.2.6.0 HD Ultra Edition (from=
 Trial-Version)</li></ol></p> eebf2c3492</div><div></div><div></div><div></=
div><div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/884680b5-6a14-49c3-a900-e96bbbbb3717n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/884680b5-6a14-49c3-a900-e96bbbbb3717n%40googlegroups.co=
m</a>.<br />

------=_Part_4587_109536116.1701771858373--

------=_Part_4586_726307475.1701771858373--
