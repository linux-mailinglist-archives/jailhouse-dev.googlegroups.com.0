Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBHVAZO2AMGQEZUBQ64Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0393071D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 21:06:07 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-e03a92302d1sf5043497276.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2024 12:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720897567; x=1721502367; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHPC0e2USbWdx/273AQLTPXyb2qVi8UNOykQURX13lU=;
        b=vWSvJ9xcFNQ/nlESiK4ailiEDXJZzHonGBhVz9/VZT+VJOyGGtmyDzPHuJoW2FDFdd
         5t5GRiAfxZtxOUDmVxqfQBbduaTeCPK75hMzKXWHdLyqavqvL63TL+UyiSTXMSuk9eVL
         lwYhywGAhT+c2Q89jz06TN7gSH8v8RTe0auiBV+9CQgGwWapM9QeijVB7fD+c9hnbdme
         NpdB19JBWoUNeuupmeitGF6gB3EVEOSN6H/yfWg0tbwrnwQD2jYbpsGeciBOEmo66c6S
         34woar8Tpgrw1aznFK+m7/Puz7SzGkVQQTcqwX4mJ95JIkNCqHU9laY39H4BygRLdO1m
         Wfwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720897567; x=1721502367; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHPC0e2USbWdx/273AQLTPXyb2qVi8UNOykQURX13lU=;
        b=MKwGFjBhgqnul+6eTEY2h7JKvUClMee0rjAP/t0nOgNQGYPYgb6AFvdM37iIpkpGek
         eZfNfaRwL1cxdibhvHLV9+/wjX5PZz4E2g502qIxnNuzYAOAGjYSISTppsGJeFEw2TML
         EKkgQ1RWziq3GdoCUxfkonvlQ1CWoLGsdetfJqdOuhDQFkk+bRi9Z6njbHQn3f9J9Z0I
         2vbDPVFMXqP8CmKkjydeKKXs7sM8sHKZ7xUjERAFphGlYR6FLXrg6uXdQs2A01zRQ7Xi
         dYrgl9ODAzsSzrjbiGS7/WSTklESnoAQaD0Q1MnYSmf+Co81syWk3HAMU2UG2kJjq2Fa
         b4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720897567; x=1721502367;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHPC0e2USbWdx/273AQLTPXyb2qVi8UNOykQURX13lU=;
        b=M+TWyXGmmuKwyqjJeVsqgCVvi0TtgHnF8iUY1Wrlx1kHIkEg2kYRMiOhzwPKWiGvQu
         cJkm0hWFa0BhHkYynUTD0n0P7qyzOhhxLaTDYYrhkvxbEnc2Lpr3tpZ4SVjybK+PY3PB
         VzAXa3BM/dFcA3hKEAprpeFjAR19EyXCb1IogyaueZ9oJhgT/6x/1yfSh/fKRMXTJiTm
         UFe1NU5qiYkFqGRWRT3cBKPxeEKkJ64S8lyGeqgEcDawopodDAa32SH+oBgM7k9MYXpG
         gmTV1RFsdO59E74Vc+UR6PGz6q+XQN6xv7Rkh1KYw9y7GXV+P5b9lbyNaKz6tRsvUZDx
         0PXQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUecvDvq22YuZHM1hgK/P+CGi3iibWyNCnFypd0V8zFUxoDgYQV/PRtl6+fmG3DMuFKOcWW4dVgnj16cFS2EPP+kDFbV+GpW9anhhw=
X-Gm-Message-State: AOJu0YzPWfaY24ixwSSwAM/5LkxRxtB0vV3ukLhKqchZ1lzNRl5mkUwA
	OuFVSuiHnHCsbjw6IdxDPM26HN0wsgbVZFyyoA3qFr80/1uzegXX
X-Google-Smtp-Source: AGHT+IHu2e1mU+nLjxG6TLDK3pgjt4q88545hDcT9GYiZNIZj/S9d1G3j/hX8/Y3lzKuLmY9yLu3GQ==
X-Received: by 2002:a25:d845:0:b0:e03:5237:79e3 with SMTP id 3f1490d57ef6-e041b15802emr16519482276.54.1720897566788;
        Sat, 13 Jul 2024 12:06:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:2b86:b0:e03:3d23:3957 with SMTP id
 3f1490d57ef6-e0579278ac1ls4633911276.2.-pod-prod-05-us; Sat, 13 Jul 2024
 12:06:05 -0700 (PDT)
X-Received: by 2002:a05:690c:67c5:b0:627:dad9:bf54 with SMTP id 00721157ae682-658f10b0c9emr2092457b3.10.1720897565437;
        Sat, 13 Jul 2024 12:06:05 -0700 (PDT)
Date: Sat, 13 Jul 2024 12:06:04 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fa2402da-3e44-4bb9-91b9-5e7b33d9b856n@googlegroups.com>
In-Reply-To: <808f0d80-24e8-44f0-ad9b-93be9473040bn@googlegroups.com>
References: <808f0d80-24e8-44f0-ad9b-93be9473040bn@googlegroups.com>
Subject: Re: WERE TO BUY MUSHROOM CHOCOLATE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_524896_625928577.1720897564736"
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

------=_Part_524896_625928577.1720897564736
Content-Type: multipart/alternative; 
	boundary="----=_Part_524897_633300177.1720897564736"

------=_Part_524897_633300177.1720897564736
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


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
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelicsWERE
=EE=85=9FReply all
=EE=85=9EReply to author
=EE=85=94Forward


On Saturday, July 13, 2024 at 6:44:10=E2=80=AFPM UTC+1 Asah Randy wrote:

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
> increased in popularity.  https://t.me/motionking_caliweed_psychedelics
>
> https://t.me/motionking_caliweed_psychedelicsWERE
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fa2402da-3e44-4bb9-91b9-5e7b33d9b856n%40googlegroups.com.

------=_Part_524897_633300177.1720897564736
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div style=3D"bottom: auto; left: 0px; position: absolute;=
 right: auto; top: 0px; overflow: hidden; z-index: 1; display: flex; flex-d=
irection: column; width: 980px; height: 1708px;"><span role=3D"main" style=
=3D"contain: style; display: block; overflow-y: auto; z-index: 1; height: 1=
644px; margin-left: 0px; visibility: visible; opacity: 1;"><span style=3D"c=
ontain: style; display: block; height: 1644px; overflow: hidden; z-index: 1=
;"><div style=3D"display: flex; flex-direction: column; height: 1644px; mar=
gin-inline-start: 16px; position: relative;"><div style=3D"overflow-y: auto=
; outline: none;"><div role=3D"list" aria-label=3D"WERE TO BUY MUSHROOM CHO=
COLATE"><span tabindex=3D"0" role=3D"listitem" aria-expanded=3D"true" style=
=3D"border-bottom: none; padding-top: 8px; padding-left: 0px; border-left: =
2px solid rgb(77, 144, 240);"><div tabindex=3D"-1" style=3D"outline: none;"=
><div style=3D"display: flex;"><div style=3D"flex-grow: 1; min-width: 0px;"=
><div role=3D"region" aria-labelledby=3D"c49" style=3D"margin: 12px 0px; ov=
erflow: auto; padding-right: 20px;"><div>Mushroom Belgian Milk Chocolate is=
 not only delicious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><d=
iv><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelic=
s" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">h=
ttps://t.me/motionking_caliweed_psychedelics</a></div><div><br /></div><div=
>=C2=A0 psilocybin-containing mushrooms. Aside from the fantastic, mind-blo=
wing effects, you get from eating the Mushroom and polka dot company chocol=
ate, they are also a great way to microdose magic mushrooms. Microdosing ma=
gic mushrooms in the form of consuming mushroom chocolate bars have recentl=
y increased in popularity.=C2=A0=C2=A0<a href=3D"https://t.me/motionking_ca=
liweed_psychedelics" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb=
(26, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a><br /></d=
iv><div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psyche=
delics" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232=
);">https://t.me/motionking_caliweed_psychedelics</a>WERE</div></div><div s=
tyle=3D"padding: 16px 0px;"><div role=3D"button" tabindex=3D"0" style=3D"us=
er-select: none; transition: background 0.2s ease 0.1s; border: 1px solid r=
gb(218, 220, 224); border-radius: 4px; color: rgb(95, 99, 104); cursor: poi=
nter; display: inline-block; font-family: &quot;Google Sans&quot;, Roboto, =
Arial, sans-serif; letter-spacing: 0.25px; line-height: 34px; min-width: au=
to; outline: none; overflow: hidden; position: relative; text-align: center=
; z-index: 0; box-sizing: border-box; height: 36px; margin-right: 16px;"><d=
iv style=3D"transform: translate(-50%, -50%) scale(0); transition: opacity =
0.2s ease 0s, visibility 0s ease 0.2s, transform 0s ease 0.2s, -webkit-tran=
sform 0s ease 0.2s; background-size: cover; left: 0px; opacity: 0; pointer-=
events: none; position: absolute; top: 0px; visibility: hidden; background-=
image: radial-gradient(circle farthest-side, rgba(95, 99, 104, 0.16), rgba(=
95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) 100%);"></div><div style=3D"po=
sition: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; background-=
color: rgb(95, 99, 104); opacity: 0;"></div><span style=3D"align-items: cen=
ter; display: flex; position: relative; padding: 0px 15px 0px 11px;"><span =
style=3D"align-items: center; display: flex; color: currentcolor; fill: cur=
rentcolor; margin-right: 8px;"><span aria-hidden=3D"true" style=3D"font-fam=
ily: &quot;Material Icons Extended&quot;; font-size: 24px; line-height: 1; =
letter-spacing: normal; text-rendering: optimizelegibility; display: inline=
-block; overflow-wrap: normal; direction: ltr; font-feature-settings: &quot=
;liga&quot;;">=EE=85=9F</span></span><span style=3D"display: inline-block; =
margin: 0px;">Reply all</span></span></div><div role=3D"button" tabindex=3D=
"0" style=3D"user-select: none; transition: background 0.2s ease 0.1s; bord=
er: 1px solid rgb(218, 220, 224); border-radius: 4px; color: rgb(95, 99, 10=
4); cursor: pointer; display: inline-block; font-family: &quot;Google Sans&=
quot;, Roboto, Arial, sans-serif; letter-spacing: 0.25px; line-height: 34px=
; min-width: auto; outline: none; overflow: hidden; position: relative; tex=
t-align: center; z-index: 0; box-sizing: border-box; height: 36px; margin-r=
ight: 16px;"><div style=3D"transform: translate(-50%, -50%) scale(0); trans=
ition: opacity 0.2s ease 0s, visibility 0s ease 0.2s, transform 0s ease 0.2=
s, -webkit-transform 0s ease 0.2s; background-size: cover; left: 28.3577px;=
 opacity: 0; pointer-events: none; position: absolute; top: 27.1709px; visi=
bility: hidden; background-image: radial-gradient(circle farthest-side, rgb=
a(95, 99, 104, 0.16), rgba(95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) 100=
%); width: 162px; height: 162px;"></div><div style=3D"position: absolute; t=
op: 0px; right: 0px; bottom: 0px; left: 0px; background-color: rgb(95, 99, =
104); opacity: 0;"></div><span style=3D"align-items: center; display: flex;=
 position: relative; padding: 0px 15px 0px 11px;"><span style=3D"align-item=
s: center; display: flex; color: currentcolor; fill: currentcolor; margin-r=
ight: 8px;"><span aria-hidden=3D"true" style=3D"font-family: &quot;Material=
 Icons Extended&quot;; font-size: 24px; line-height: 1; letter-spacing: nor=
mal; text-rendering: optimizelegibility; display: inline-block; overflow-wr=
ap: normal; direction: ltr; font-feature-settings: &quot;liga&quot;;">=EE=
=85=9E</span></span><span style=3D"display: inline-block; margin: 0px;">Rep=
ly to author</span></span></div><div role=3D"button" tabindex=3D"0" style=
=3D"user-select: none; transition: background 0.2s ease 0.1s; border: 1px s=
olid rgb(218, 220, 224); border-radius: 4px; color: rgb(95, 99, 104); curso=
r: pointer; display: inline-block; font-family: &quot;Google Sans&quot;, Ro=
boto, Arial, sans-serif; letter-spacing: 0.25px; line-height: 34px; min-wid=
th: auto; outline: none; overflow: hidden; position: relative; text-align: =
center; z-index: 0; box-sizing: border-box; height: 36px; margin-right: 16p=
x;"><div style=3D"transform: translate(-50%, -50%) scale(0); transition: op=
acity 0.2s ease 0s, visibility 0s ease 0.2s, transform 0s ease 0.2s, -webki=
t-transform 0s ease 0.2s; background-size: cover; left: 0px; opacity: 0; po=
inter-events: none; position: absolute; top: 0px; visibility: hidden; backg=
round-image: radial-gradient(circle farthest-side, rgba(95, 99, 104, 0.16),=
 rgba(95, 99, 104, 0.16) 80%, rgba(95, 99, 104, 0) 100%);"></div><div style=
=3D"position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; backg=
round-color: rgb(95, 99, 104); opacity: 0;"></div><span style=3D"align-item=
s: center; display: flex; position: relative; padding: 0px 15px 0px 11px;">=
<span style=3D"align-items: center; display: flex; color: currentcolor; fil=
l: currentcolor; margin-right: 8px;"><span aria-hidden=3D"true" style=3D"fo=
nt-family: &quot;Material Icons Extended&quot;; font-size: 24px; line-heigh=
t: 1; letter-spacing: normal; text-rendering: optimizelegibility; display: =
inline-block; overflow-wrap: normal; direction: ltr; font-feature-settings:=
 &quot;liga&quot;;">=EE=85=94</span></span><span style=3D"display: inline-b=
lock; margin: 0px;">Forward</span></span></div></div></div></div><div><div>=
</div></div></div></span></div></div></div></span></span></div><br /><br />=
<div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Saturd=
ay, July 13, 2024 at 6:44:10=E2=80=AFPM UTC+1 Asah Randy wrote:<br/></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>Mushroom Belgian Mi=
lk Chocolate is not only delicious, but it equates to 4 grams of=C2=A0=C2=
=A0=C2=A0</div><div><br></div><div><a href=3D"https://t.me/motionking_caliw=
eed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;us=
t=3D1720983909240000&amp;usg=3DAOvVaw2zGcDzFdRZe_uRbvdBscSI">https://t.me/m=
otionking_caliweed_psychedelics</a></div><div><br></div><div>=C2=A0 psilocy=
bin-containing mushrooms. Aside from the fantastic, mind-blowing effects, y=
ou get from eating the Mushroom and polka dot company chocolate, they are a=
lso a great way to microdose magic mushrooms. Microdosing magic mushrooms i=
n the form of consuming mushroom chocolate bars have recently increased in =
popularity.=C2=A0=C2=A0<a href=3D"https://t.me/motionking_caliweed_psychede=
lics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1720983909=
240000&amp;usg=3DAOvVaw2zGcDzFdRZe_uRbvdBscSI">https://t.me/motionking_cali=
weed_psychedelics</a><br></div><div><br></div><div><a href=3D"https://t.me/=
motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,11=
5,232)" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=
=3Dgmail&amp;ust=3D1720983909240000&amp;usg=3DAOvVaw2zGcDzFdRZe_uRbvdBscSI"=
>https://t.me/motionking_caliweed_psychedelics</a>WERE</div></blockquote></=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fa2402da-3e44-4bb9-91b9-5e7b33d9b856n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fa2402da-3e44-4bb9-91b9-5e7b33d9b856n%40googlegroups.co=
m</a>.<br />

------=_Part_524897_633300177.1720897564736--

------=_Part_524896_625928577.1720897564736--
