Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBEHC6SZAMGQESLNEWPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF698D7A33
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 04:57:22 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df7bdb0455bsf6049727276.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717383441; x=1717988241; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fsw/bJHjcsluvpCrHBISuQVQu8M68oGvMo+lObQCxos=;
        b=GPJkT+vtdqYNgm3F6RZc1qyCCU1IJXtcve7eWEyM2v4T7YXCNJbrKZ4QNFtqYcr1ah
         uOAX00DKk5rBQON6kHvWhTQFqdVMM0zDwMDcb/6fbb0p14+X+hedfk3FCCQ6BZTrstSD
         zh3CABIKuYW1CVVzCIPvkrROay7WAfEPANgbs2E6DBYVKp2zvEiNEj3DJikcI07TM3dk
         kiBZcjuYQbSaz5+qJ/C/mB2jLmiT7XuVliP+co4twqxRte3syJ8FwV9YppEjj5YBYEzc
         WtrNk0AwM5PQzRFGbp6Ihvk5WEnr0svcJ7S1LIOP0IkijbrBpDFOosu1QSUaoJ88h4Aq
         Io9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717383441; x=1717988241; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fsw/bJHjcsluvpCrHBISuQVQu8M68oGvMo+lObQCxos=;
        b=K0vqLGYwpF2+ti0Vf4oMhZpLkdrzLVnlXssVOInXYtjscEc0DNs8rTOzR9zNxFAOlc
         vv5cvJTlP5H7pjLoiN7WKtj4HVK8NEUYzRfl2+dQKelwlua6fsUyNVQAg6aUq1akSqkH
         QzN/r9oyGveLnjcTw/0p7ZH8NknY8gicRUEMMK/zcVAczDFk29MOFnjeh+j/SyNB4a96
         Al+idKjbgQt0V1Z6ccaNfIS5JZ2Omj2ud9eC7y6xWfjfRlYDD64XMXwl9mouK4wkjF+/
         vCMPDrOk21yyYU2agRewFAFXPWzv+fL3FHYmqO8A+D5T5H5sSZliblQjV0T9NbFa0SSh
         i5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717383441; x=1717988241;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fsw/bJHjcsluvpCrHBISuQVQu8M68oGvMo+lObQCxos=;
        b=wT67nBQzhCt6NGGeC+ZqmcdmGLaTDVS03UObTzKzOKhiLmaMKT8d+XuppcpFyZfk8a
         4XINq79Kr3ZHHnCSoMjF80XAeMNaJPE21TCoRwKYLzoMoDV23hC3l2vYTudwbPoFCtuv
         gQuK6NZk6JqyUz3Unu5uBjrDufy2X78VHbiPGF8ogVQrBE6GhOfOh9nK1lZavYWm9lSZ
         6+RVms7PDy/0YfpcumTKZpw2rQxzPHr9G0Am7EkjE4osHmSeGTWsiUc9lTlTuqTN3cI9
         WxtqJaEhIwkaoeLHSn8yNmPfBINIXLabYAvQZJZJH8noWL6TV92tgEPqUCtBIxSC66Yk
         ZOcg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW+SvQ+3PQ5BdrpKzqrU/IITJJOEFlQLHQ0dX8Ehzyb9eKq1G6dykC3A5ixVHx0iHdGwXgczx9gVABkLjN4mh1gu6HbCW2WhgrrPHg=
X-Gm-Message-State: AOJu0YwJx0asX9eu1KeirkPjXweJ4c+5rxepJTRvyTFXsxGBFi6Lsw9v
	4KJIm9c7gBhEChvzJwTSB0Q9KIzS63zRXZRhyha3ujqOXk5JPrHm
X-Google-Smtp-Source: AGHT+IFSJLZI8cmTZboH6VZvpear4sha3Cvkn52cCnwT1u9K2blMGhJ/9rUdksAi3GWgHM+yWl4C9Q==
X-Received: by 2002:a25:6b41:0:b0:dfa:6c25:a451 with SMTP id 3f1490d57ef6-dfa73dd34d1mr6757724276.58.1717383441316;
        Sun, 02 Jun 2024 19:57:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bc3:0:b0:dfa:7e23:93a1 with SMTP id 3f1490d57ef6-dfa7e23962fls771583276.0.-pod-prod-06-us;
 Sun, 02 Jun 2024 19:57:20 -0700 (PDT)
X-Received: by 2002:a25:ab13:0:b0:df7:6584:5d6f with SMTP id 3f1490d57ef6-dfa73daa1femr1956526276.13.1717383439841;
        Sun, 02 Jun 2024 19:57:19 -0700 (PDT)
Date: Sun, 2 Jun 2024 19:57:19 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <760f6010-fbec-4097-81ea-0cdb377ee019n@googlegroups.com>
In-Reply-To: <781e166c-e9bb-455e-a0e8-e7fec4d5126cn@googlegroups.com>
References: <23ea410a-e2c3-426c-8b7d-3d2a82d94dbfn@googlegroups.com>
 <28787421-30d1-4cbd-9da2-da23c674bf25n@googlegroups.com>
 <781e166c-e9bb-455e-a0e8-e7fec4d5126cn@googlegroups.com>
Subject: Re: WHAT ARE GOLDEN TEACHER MUSHROOM AND WERE ARE THEY SOLD ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_300745_1219585102.1717383439148"
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

------=_Part_300745_1219585102.1717383439148
Content-Type: multipart/alternative; 
	boundary="----=_Part_300746_99279447.1717383439148"

------=_Part_300746_99279447.1717383439148
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

Effects: Like other psilocybin-containing mushrooms, consuming Golden=20
Teacher mushrooms can lead to altered states of consciousness characterized=
=20
by visual and auditory hallucinations, changes in perception of time and=20
space, introspection, and sometimes a sense of unity or connection with=20
one's surroundings
Some key characteristics of the Golden Teacher mushroom strain include:
     Appearance: The Golden Teacher strain typically features large,=20
golden-capped mushrooms with a distinct appearance. When mature, the caps=
=20
can take on a golden or caramel color, while the stem is usually thick and=
=20
white.
     Potency: Golden Teachers are considered moderately potent among=20
psilocybin mushrooms. Their effects can vary depending on factors such as=
=20
growing conditions, individual tolerance, and dosage. Users generally=20
report a balance between visual and introspective effects.

https://t.me/motionking_caliweed_psychedelics

On Monday, June 3, 2024 at 3:55:58=E2=80=AFAM UTC+1 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
>
>
> Golden Teachers are considered moderately potent among psilocybin=20
> mushrooms. Their effects can vary depending on factors such as growing=20
> conditions, individual tolerance, and dosage. Users generally report a=20
> balance between visual and introspective effects.
>
> https://t.me/motionking_caliweed_psychedelics
>
>
>      Effects: Like other psilocybin-containing mushrooms, consuming Golde=
n=20
> Teacher mushrooms can lead to altered states of consciousness characteriz=
ed=20
> by visual and auditory hallucinations, changes in perception of time and=
=20
> space, introspection, and sometimes a sense of unity or connection with=
=20
> one's surroundings
> Some key characteristics of the Golden Teacher mushroom strain include:
>      Appearance: The Golden Teacher strain typically features large,=20
> golden-capped mushrooms with a distinct appearance. When mature, the caps=
=20
> can take on a golden or caramel color, while the stem is usually thick an=
d=20
> white.
>      Potency: Golden Teachers are considered moderately potent among=20
> psilocybin mushrooms. Their effects can vary depending on factors such as=
=20
> growing conditions, individual tolerance, and dosage. Users generally=20
> report a balance between visual and introspective effects.
>
> https://t.me/motionking_caliweed_psychedelics
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/760f6010-fbec-4097-81ea-0cdb377ee019n%40googlegroups.com.

------=_Part_300746_99279447.1717383439148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofol=
low" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https://t.me/mot=
ionking_caliweed_psychedelics</a><br /></div><div><br /></div><div style=3D=
"color: rgb(80, 0, 80);"><div>Effects: Like other psilocybin-containing mus=
hrooms, consuming Golden Teacher mushrooms can lead to altered states of co=
nsciousness characterized by visual and auditory hallucinations, changes in=
 perception of time and space, introspection, and sometimes a sense of unit=
y or connection with one's surroundings<br />Some key characteristics of th=
e Golden Teacher mushroom strain include:<br />=C2=A0 =C2=A0 =C2=A0Appearan=
ce: The Golden Teacher strain typically features large, golden-capped mushr=
ooms with a distinct appearance. When mature, the caps can take on a golden=
 or caramel color, while the stem is usually thick and white.<br />=C2=A0 =
=C2=A0 =C2=A0Potency: Golden Teachers are considered moderately potent amon=
g psilocybin mushrooms. Their effects can vary depending on factors such as=
 growing conditions, individual tolerance, and dosage. Users generally repo=
rt a balance between visual and introspective effects.</div><div><br /></di=
v></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=
=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https:/=
/t.me/motionking_caliweed_psychedelics</a></div><br /><div class=3D"gmail_q=
uote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, June 3, 2024 at 3:5=
5:58=E2=80=AFAM UTC+1 Asah Randy wrote:<br/></div><blockquote class=3D"gmai=
l_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;"><div><a href=3D"https://t.me/motionking_caliweed=
_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_=
blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dh=
ttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1=
717469760546000&amp;usg=3DAOvVaw25DVQ3yKXd7U1G6Om60X8W">https://t.me/motion=
king_caliweed_psychedelics</a><br></div><div><br></div><br><div>Golden Teac=
hers are considered moderately potent among psilocybin mushrooms. Their eff=
ects can vary depending on factors such as growing conditions, individual t=
olerance, and dosage. Users generally report a balance between visual and i=
ntrospective effects.<br><br><a href=3D"https://t.me/motionking_caliweed_ps=
ychedelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_bla=
nk" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp=
s://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717=
469760546000&amp;usg=3DAOvVaw25DVQ3yKXd7U1G6Om60X8W">https://t.me/motionkin=
g_caliweed_psychedelics</a></div><div><br><br>=C2=A0 =C2=A0 =C2=A0Effects: =
Like other psilocybin-containing mushrooms, consuming Golden Teacher mushro=
oms can lead to altered states of consciousness characterized by visual and=
 auditory hallucinations, changes in perception of time and space, introspe=
ction, and sometimes a sense of unity or connection with one&#39;s surround=
ings<br>Some key characteristics of the Golden Teacher mushroom strain incl=
ude:<br>=C2=A0 =C2=A0 =C2=A0Appearance: The Golden Teacher strain typically=
 features large, golden-capped mushrooms with a distinct appearance. When m=
ature, the caps can take on a golden or caramel color, while the stem is us=
ually thick and white.<br>=C2=A0 =C2=A0 =C2=A0Potency: Golden Teachers are =
considered moderately potent among psilocybin mushrooms. Their effects can =
vary depending on factors such as growing conditions, individual tolerance,=
 and dosage. Users generally report a balance between visual and introspect=
ive effects.</div><div><br></div><div><a href=3D"https://t.me/motionking_ca=
liweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" targe=
t=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp=
;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;u=
st=3D1717469760546000&amp;usg=3DAOvVaw25DVQ3yKXd7U1G6Om60X8W">https://t.me/=
motionking_caliweed_psychedelics</a><br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/760f6010-fbec-4097-81ea-0cdb377ee019n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/760f6010-fbec-4097-81ea-0cdb377ee019n%40googlegroups.co=
m</a>.<br />

------=_Part_300746_99279447.1717383439148--

------=_Part_300745_1219585102.1717383439148--
