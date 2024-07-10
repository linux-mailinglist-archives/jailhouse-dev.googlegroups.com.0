Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBBPTW62AMGQECBS2ZTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5492C8CE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:01:27 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-e03a4bd9aa1sf1519640276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720580486; x=1721185286; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MK89fstbFVGAyEajRSh6e/TlFhIQy5MDMk5ZGzqukLA=;
        b=LqBMwlqzTREQZXvblDiaE13vuAFwoMf5do++ain/InhJ0silvxfS2dkdct6H6W08fw
         vIMES7B7W1bf4P7h96w2UjvbxBZdY1S/iDDNb9SA2sCE8kBq1iHhTpr9imVzqwYQ93PB
         YudOYppIU0yJMtftwvjcnV5EnaszH3UYBb9xNCdEUSxDx3JvGhWeVwsLbC73t7M6KpO1
         yKGq+3G8isHHzqvVy2BccA/7i7eqNal9RVIaQ7Q+1HyEXHhqATSKK/NCCvVx2iA+AkB9
         op1yFvQoraL1lcorC3j2pXR2qdzif9lPeZr3HEVeofHTHNwDl9rofjACOvNQ+IqqRQl5
         KWEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720580486; x=1721185286; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK89fstbFVGAyEajRSh6e/TlFhIQy5MDMk5ZGzqukLA=;
        b=OVzpWH8CAdjInTPdvlKOe0zdzPhWToxv70jtRBnxLcuOxyljvp2TgKhDbT+msEI3f2
         iUa4jrmErL7SrqZBFotuAE0ydDDc6KpSHMUxNaoFLVmhdCZWIPeURwIE+5SkpEFMMwNN
         NtU+xFCzQSNRQY7v5k0Qz/bbn+ruXNuFPqspsus9swO11U0zMbMjnoBJBDS2Nzz/gWWn
         J+TrOW8YwRdjPoQk/kxDSljvcbkFLIISp+QwR/bdSyS+1xGiqlQS94gmjJIfYa64Cl/z
         RplD2DKOG2g5c6hnr+7i+96wwPuh+DDbW/7SFQkoGjXFGqxlwjeGv0e1MOMV2JvairsV
         CCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720580486; x=1721185286;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MK89fstbFVGAyEajRSh6e/TlFhIQy5MDMk5ZGzqukLA=;
        b=BLgSGUgHXNveAT7xo7gH9nV3Qy8d/GdOy5xgKbBGkf70I2Jv8tonSd8KF21dnw29n8
         Zzuc8qQr1kOqNGpEEvyFwJeuxrb+6JV/Ry6XFLwBO2UfdzLWK3sE7eyGgpz51kNHPHFH
         IIaKmmgxX78MOqBMSxhKCrCw0/OO3P6eYjpOeKXfRBSuRG0YAaeMjLk1VaZuktyJ6qb0
         0R1HzEuFr1wuCxP/KShfuo+pAOqolXgtPVfzG/xfzypN8e9D7OipHVsOIfLfnIP4f2Iq
         H/4M7Tw1kmj5H6bMNQcDEqJcQthdUzCJoyjNDQa0ovfzgmWv/kCoAtu2UrKutMQPf73f
         THSg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWKr0pcUlaPY5Kwm0AkGC2fUf83kxeu4WU1fLY68On9QLM74DF2MTGVFg5TD8t8NW0lbeh8dUPsesGcVncY8OSXD5ZGu6RsxDnrFng=
X-Gm-Message-State: AOJu0YwYvk2AxrCv2pzb+0wlzj6ttSoG2blkZLmsPEvQ7v0VbBeZ3JuA
	vA1AwNKN8UQtszJntYjJbRvtsbD4Y2kePAwc1Lf7g404kHst8VmN
X-Google-Smtp-Source: AGHT+IEl96D3OSgXDkfBMYUOK1RTLGh1kx6pD6NaC5Lxoo0CY4FtbKngKMrJdPRZYoiglvsKIeGjvg==
X-Received: by 2002:a05:6902:134b:b0:e03:34ec:16bf with SMTP id 3f1490d57ef6-e041af5dce3mr4135121276.0.1720580486288;
        Tue, 09 Jul 2024 20:01:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:102a:b0:e03:bbb7:44ea with SMTP id
 3f1490d57ef6-e03bce3cc6bls9113032276.0.-pod-prod-07-us; Tue, 09 Jul 2024
 20:01:25 -0700 (PDT)
X-Received: by 2002:a05:6902:2b0d:b0:dfb:1147:cbaa with SMTP id 3f1490d57ef6-e041b111731mr416323276.10.1720580484858;
        Tue, 09 Jul 2024 20:01:24 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:01:24 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ef498f74-6a26-4848-838d-6e7d887d8281n@googlegroups.com>
In-Reply-To: <09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n@googlegroups.com>
References: <717d828e-db8b-4978-81c0-d4701b5cd5a6n@googlegroups.com>
 <0a1d2b6c-6168-4572-9677-b1ca4325470en@googlegroups.com>
 <b0c1a293-aa7f-4e3a-9afa-c576dc42a378n@googlegroups.com>
 <09e4e05f-7dbe-4327-bd28-81ba4c1d61c4n@googlegroups.com>
Subject: Re: Mushroom Belgian Milk Chocolate is not only delicious, but it
 equates to 4 grams of
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_75194_173656362.1720580484165"
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

------=_Part_75194_173656362.1720580484165
Content-Type: multipart/alternative; 
	boundary="----=_Part_75195_92508549.1720580484165"

------=_Part_75195_92508549.1720580484165
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4=
=20
grams of  =20

https://t.me/motionking_caliweed_psychedelics

  psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
effects, you get from eating the Mushroom and polka dot company chocolate,=
=20
they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
mushrooms in the form of consuming mushroom chocolate bars have recently=20
increased in popularity.  https://t.me/motionking_caliweed_psychedelics=20

https://t.me/motionking_caliweed_psychedelics

On Tuesday, July 9, 2024 at 9:00:39=E2=80=AFPM UTC-6 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
>
> Mushroom Belgian Milk Chocolate is not only delicious, but it equates to =
4=20
> grams of  =20
>
> https://t.me/motionking_caliweed_psychedelics
>
>   psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
> effects, you get from eating the Mushroom and polka dot company chocolate=
,=20
> they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
> increased in popularity.  https://t.me/motionking_caliweed_psychedelics=
=20
>
> https://t.me/motionking_caliweed_psychedelics
>
>
> On Tuesday, July 9, 2024 at 7:28:33=E2=80=AFAM UTC-6 Asah Randy wrote:
>
>>
>> Mushroom Belgian Milk Chocolate is not only delicious, but it equates to=
=20
>> 4 grams of  =20
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>   psilocybin-containing mushrooms. Aside from the fantastic, mind-blowin=
g=20
>> effects, you get from eating the Mushroom and polka dot company chocolat=
e,=20
>> they are also a great way to microdose magic mushrooms. Microdosing magi=
c=20
>> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
>> increased in popularity.  https://t.me/motionking_caliweed_psychedelics=
=20
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ef498f74-6a26-4848-838d-6e7d887d8281n%40googlegroups.com.

------=_Part_75195_92508549.1720580484165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv><div>Mushroom Belgian Milk Chocolate is not only delicious, but it equat=
es to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br /></div><div><a href=3D"ht=
tps://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofol=
low">https://t.me/motionking_caliweed_psychedelics</a></div><div><br /></di=
v><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank"=
 rel=3D"nofollow">https://t.me/motionking_caliweed_psychedelics</a> <br /><=
/div><div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" target=3D"_blank" rel=3D"nofollow">https://t.me/motionking_caliwe=
ed_psychedelics</a></div></div><br /><div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">On Tuesday, July 9, 2024 at 9:00:39=E2=80=AFPM =
UTC-6 Asah Randy wrote:<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;"><div><a href=3D"https://t.me/motionking_caliweed_psychedelics"=
 target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&a=
mp;source=3Dgmail&amp;ust=3D1720666841615000&amp;usg=3DAOvVaw2Cm5BwIdPad-Mt=
yAb34cni">https://t.me/motionking_caliweed_psychedelics</a></div><div><br><=
/div><div><span role=3D"listitem" aria-expanded=3D"true"><div><div><div><di=
v role=3D"region" aria-labelledby=3D"c99"><div>Mushroom Belgian Milk Chocol=
ate is not only delicious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0</=
div><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psyched=
elics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychede=
lics&amp;source=3Dgmail&amp;ust=3D1720666841615000&amp;usg=3DAOvVaw2Cm5BwId=
Pad-MtyAb34cni">https://t.me/motionking_caliweed_psychedelics</a></div><div=
><br></div><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720666841615000&amp;usg=3DAOvVaw2Cm5BwIdPad-MtyAb34cni">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720666841615000&amp;usg=3DAOvVaw2Cm5BwIdPad-MtyAb34cni">https://t.m=
e/motionking_caliweed_psychedelics</a></div></div></div></div><div><div></d=
iv></div></div></span><span role=3D"listitem" aria-expanded=3D"false"><div>=
<div><div aria-hidden=3D"true"><div><div><br></div></div></div></div></div>=
</span></div><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmai=
l_attr">On Tuesday, July 9, 2024 at 7:28:33=E2=80=AFAM UTC-6 Asah Randy wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><di=
v><div>Mushroom Belgian Milk Chocolate is not only delicious, but it equate=
s to 4 grams of=C2=A0=C2=A0=C2=A0</div><div><br></div><div><a href=3D"https=
://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank=
" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:=
//t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D172066=
6841615000&amp;usg=3DAOvVaw2Cm5BwIdPad-MtyAb34cni">https://t.me/motionking_=
caliweed_psychedelics</a></div><div><br></div><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720666841615000&amp;usg=3DAOvVaw2Cm5BwIdPad-MtyAb34cni">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720666841615000&amp;usg=3DAOvVaw2Cm5BwIdPad-MtyAb34cni">https://t.m=
e/motionking_caliweed_psychedelics</a></div></div><br></blockquote></div></=
blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ef498f74-6a26-4848-838d-6e7d887d8281n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ef498f74-6a26-4848-838d-6e7d887d8281n%40googlegroups.co=
m</a>.<br />

------=_Part_75195_92508549.1720580484165--

------=_Part_75194_173656362.1720580484165--
