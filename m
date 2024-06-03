Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBX766SZAMGQEVBFVOYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2508D7A9A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 05:58:25 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-df796aaa57dsf4198519276.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 20:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717387104; x=1717991904; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiuT4MfE0NshhN3tcfv3DFmfvVcODQdzRWMSE8ZlOOg=;
        b=akGuFAbTB2cTURNRksGwUidT3RkNLArRM5zPR4tugO26FyelyGaOiAeXG1C/2tKkS0
         p4vzwmmU9ADPvwvRJ/WJ9dk3qRbwwWR+aqmzWStVD71FuHMAi7nWKQB3qJxM1oFaNY+r
         sUiAHhWHVaDt4gZ2IlBcdYP6I+m5k9VQqJvC8rF55AgGql3tdRpkcnGMKChkP2KwWaEf
         LvemFpP3gsVFyPb+bZvKGT7FuMGb5+S/r9rpIiZQNRH00E8v1nTE+1OpPVazK6LQHVyf
         bChDSRrSw030k6R933HGtUI0lcKDQX/RuwAWXEb8ZvooZcyc4g8AKIyJ7F40nCMj1/B1
         xyeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717387104; x=1717991904; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiuT4MfE0NshhN3tcfv3DFmfvVcODQdzRWMSE8ZlOOg=;
        b=AMo5J9GKWDl/NLw7+q9En65wQ+SFqsznx08ucJnyBvJIdOc9N5TJ0DoXMyPUcYnMqA
         T8hEsNyMK1KNmiL7Z8TEizozj1COPFQ1pbUfAmGSzGg4ViC54l40W2imAmccaomeGG9B
         NbehgTUo/bXc6cFx3GjDeVqp68Ffl/xnwte3TcVsR/NOnodxw5lK6sBgY0zne/Q9iS6G
         DBA+qX2uH3TIeb6Yl35DbLdfeKHRHBnQsY/D20S2mGYOMVQFopYQIx88sjpgphRaHeG7
         2BRfh28wXnO5dzfmaluRKEoRyLghjq5DVbf0J8BL93MH9ijdqachrW+K0vrS7fMRyKzr
         kMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717387104; x=1717991904;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiuT4MfE0NshhN3tcfv3DFmfvVcODQdzRWMSE8ZlOOg=;
        b=FyJ3pQHCm+w359/CohKG0y+UfM/L5rTDcyPk0hkawDv7GW/4MPPRgFoUxwlFUijMfd
         NMGhwbd2ARuHUZLBJs0QpnOiw9XzFiRju7sCbqbocDIeMD3aljXtr0ApUGjU/CBqefSj
         zlL0yXNVlU+U0tnctOLhm5teisEozWa/ilNSfC3KULCVw0rD3kGamscA3RStX5NPeLSP
         iNK5LpDM5ZjpitQM1pR3rkyJLmQbIqy9dwbkvNwAQm0Wosxfl3jWcVAQNs5RIPqW/mIn
         4Gy9eNinZD1QRNN1tv9rxLKTVu0iROUBsccNpxLtVIxX/+LKRZM3UHx287brvmRjKb+0
         k3Ow==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU2SDY0Tdx7OnfjGn4nQ3j6aj9UN7dlSqGasjJD2doGjBTRQLgEGBnLZmrTFuXNljHGnNfF8C3NPSbnJAqMkIFnP94AiWbHwEfodl8=
X-Gm-Message-State: AOJu0YynS8Zu+5RSkfJBnEHiDCSn11Gry0YveJXbOYXWBpww4uiotdHz
	BgbjNLEkpdB/bRn4x0f014mTIPf+PDvACaC88jpTExkUIW1u2oAb
X-Google-Smtp-Source: AGHT+IFe21DJFCaTNLlPiikEl/AdlddCNoMAYtPjbyr5xu9WB0pLfBHE8GJuc+DC2q+Du0Rao8nNCA==
X-Received: by 2002:a25:aba6:0:b0:df4:958e:6479 with SMTP id 3f1490d57ef6-dfa73d909fbmr7646863276.46.1717387104080;
        Sun, 02 Jun 2024 20:58:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:103:0:b0:df7:71d2:bccb with SMTP id 3f1490d57ef6-dfa59aef9f7ls164556276.1.-pod-prod-00-us;
 Sun, 02 Jun 2024 20:58:22 -0700 (PDT)
X-Received: by 2002:a05:6902:2b88:b0:df4:8e99:f2 with SMTP id 3f1490d57ef6-dfa728683fdmr2597811276.5.1717387102454;
        Sun, 02 Jun 2024 20:58:22 -0700 (PDT)
Date: Sun, 2 Jun 2024 20:58:21 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4706bf6e-e51a-4400-863a-f4bd5e2a9cd9n@googlegroups.com>
In-Reply-To: <ae0f8511-da6a-4d53-9679-7d06697e8397n@googlegroups.com>
References: <8b41dd4b-2df0-4408-bbc2-5c0597a5b5d7n@googlegroups.com>
 <ae0f8511-da6a-4d53-9679-7d06697e8397n@googlegroups.com>
Subject: Re: K2 Sheets Spice K2 Spray +13348395202
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_315158_205385406.1717387101568"
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

------=_Part_315158_205385406.1717387101568
Content-Type: multipart/alternative; 
	boundary="----=_Part_315159_1403914300.1717387101568"

------=_Part_315159_1403914300.1717387101568
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


https://t.me/motionking_caliweed_psychedelics

Buy K2 Spice Paper,K2 Paper,K2 Spray,K2 Liquid,Buy K2 herb,Buy K2=20
Chemicals.Every  K2 Sheets is infuse with 200 ml of the k2 liquid Diablo=20
Incense.

I have the k2 sheets already made, i have the k2 paper ,k2 spray ,k2 liquid=
.

I can infuse k2 sheets ,k2 envelopes ,k2 magazines ,k2 books.

Cannabinoids | Noids | Synthetic Cannabinoids

K2 Spice paper | K2 paper | K2 Spray | 5cladba | 5F-Mdmb2201 | JWH018 |=20
SGT-78 | 5-CL-ADB-A | 4F-ADB | 5F-MDA19 | MDA-19

5F-MDMB-2201 | 7add | 5F-Mdmb 2201 Pica | MDMB-4en-PINACA

AB-PINACA | JWH-250 | 4f-mdmb-2201 | Amb-fubinaca | 4f-adb | 4FADB

6Cladba | GBH | GBL | SGT 78 | Crack C | 6-APDB

BMK-Oil | MDP2P | PMK Oil | 5F-AKB-48 | 5F-PB22 | 6-APB

we do K2 Express overnight shipping and we can also make your k2 sheets=20
come in the form of legal mail.

#k2sheetsforsale

#buyk2sheets=20

#k2paperforsale

#k2liquidforsale

#k2spiceforsale

#k2sprayforsale

You can buy the k2 spice  sheets and write a nice loving letter to your pal=
=20
in prison.

The k2 sheets are clean and have no stains and can pass all test to get=20
into any and every facility without any problems.

K2 Spice Spray Diablo. Diablo K2 liquid spray on paper is one of the best=
=20
selling item from the top-rated company Diablo. Diablo incense infused=20
sheets.=20

Diablo k2 spray on paper, Diablo K2 Liquid Spray on Paper, Buy Diablo K2=20
paper, diablo k2 for sale, diablo incense spray, diablo k2 spray bottle.=20

K2 Spray=20

5F-MDMB2201=20

 5CL-ADB-A=20

Diablo k2 paper=20

Cannabinoid k2 paper=20

K2 eliquid paper=20

JWH-018 k2 paper=20

Bizzaro k2 papers=20

White Tiger k2 paper=20

Green Giant k2 paper=20

Cloud 9 k2 paper=20

Kush K2 paper=20

Kratom k2 paper=20

Mad Halloween k2 paper=20

7H punch k2 paper=20

Pink blossom k2 paper=20

Mr. Nice guy k2 paper=20

Kilmaxx k2 paper=20

Green blossom k2 paper=20

buy k2 liquid spice spray and papers online, get the best diablo spray=20
infuse in 100% cotton papers. I have the k2 sheets, k2 envelopes, k2=20
greeting cards, k2 books, k2 magazines.

I can send it legal mail and can also make it look like it's coming=20
directly from a bookstore.

If you're looking for the k2 spice diablo sheets or liquid to give you that=
=20
man-down effect (Diablo!!).




https://t.me/motionking_caliweed_psychedelics
On Monday, June 3, 2024 at 4:56:11=E2=80=AFAM UTC+1 Asah Randy wrote:

>
> https://t.me/motionking_caliweed_psychedelics
>
>
> Buy K2 Sheets ,Buy K2 Spice Paper,K2 Paper,K2 Spray,K2 Liquid,Buy K2=20
> herb,Buy K2 Chemicals.Every  K2 Sheets is infuse with 200 ml of the k2=20
> liquid Diablo Incense.
>
> I have the k2 sheets already made, i have the k2 paper ,k2 spray ,k2=20
> liquid.
>
> I can infuse k2 sheets ,k2 envelopes ,k2 magazines ,k2 books.
>
> Cannabinoids | Noids | Synthetic Cannabinoids
>
> K2 Spice paper | K2 paper | K2 Spray | 5cladba | 5F-Mdmb2201 | JWH018 |=
=20
> SGT-78 | 5-CL-ADB-A | 4F-ADB | 5F-MDA19 | MDA-19
>
> 5F-MDMB-2201 | 7add | 5F-Mdmb 2201 Pica | MDMB-4en-PINACA
>
> AB-PINACA | JWH-250 | 4f-mdmb-2201 | Amb-fubinaca | 4f-adb | 4FADB
>
> 6Cladba | GBH | GBL | SGT 78 | Crack C | 6-APDB
>
> BMK-Oil | MDP2P | PMK Oil | 5F-AKB-48 | 5F-PB22 | 6-APB
>
> we do K2 Express overnight shipping and we can also make your k2 sheets=
=20
> come in the form of legal mail.
>
> #k2sheetsforsale
>
> #buyk2sheets=20
>
> #k2paperforsale
>
> #k2liquidforsale
>
> #k2spiceforsale
>
> #k2sprayforsale
>
> You can buy the k2 spice  sheets and write a nice loving letter to your=
=20
> pal in prison.
>
> The k2 sheets are clean and have no stains and can pass all test to get=
=20
> into any and every facility without any problems.
>
> K2 Spice Spray Diablo. Diablo K2 liquid spray on paper is one of the best=
=20
> selling item from the top-rated company Diablo. Diablo incense infused=20
> sheets.=20
>
> Diablo k2 spray on paper, Diablo K2 Liquid Spray on Paper, Buy Diablo K2=
=20
> paper, diablo k2 for sale, diablo incense spray, diablo k2 spray bottle.=
=20
>
> K2 Spray=20
>
> 5F-MDMB2201=20
>
>  5CL-ADB-A=20
>
> Diablo k2 paper=20
>
> Cannabinoid k2 paper=20
>
> K2 eliquid paper=20
>
> JWH-018 k2 paper=20
>
> Bizzaro k2 papers=20
>
> White Tiger k2 paper=20
>
> Green Giant k2 paper=20
>
> Cloud 9 k2 paper=20
>
> Kush K2 paper=20
>
> Kratom k2 paper=20
>
> Mad Halloween k2 paper=20
>
> 7H punch k2 paper=20
>
> Pink blossom k2 paper=20
>
> Mr. Nice guy k2 paper=20
>
> Kilmaxx k2 paper=20
>
> Green blossom k2 paper=20
>
> buy k2 liquid spice spray and papers online, get the best diablo spray=20
> infuse in 100% cotton papers. I have the k2 sheets, k2 envelopes, k2=20
> greeting cards, k2 books, k2 magazines.
>
> I can send it legal mail and can also make it look like it's coming=20
> directly from a bookstore.
>
> If you're looking for the k2 spice diablo sheets or liquid to give you=20
> that man-down effect (Diablo!!).
>
>
> https://t.me/motionking_caliweed_psychedelics
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4706bf6e-e51a-4400-863a-f4bd5e2a9cd9n%40googlegroups.com.

------=_Part_315159_1403914300.1717387101568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div>https://t.me/motionking_caliweed_psychedelics<br /></=
div><div><br /></div><p style=3D"font-variant-numeric: normal; font-variant=
-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: no=
rmal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning: a=
uto; font-feature-settings: normal;">Buy K2 Spice Paper,K2 Paper,K2 Spray,K=
2 Liquid,Buy K2 herb,Buy K2 Chemicals.Every =C2=A0K2 Sheets is infuse with =
200 ml of the k2 liquid Diablo Incense.<br /></p><p style=3D"font-variant-n=
umeric: normal; font-variant-east-asian: normal; font-stretch: normal; font=
-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
margin: 0px; font-kerning: auto; font-feature-settings: normal;">I have the=
 k2 sheets already made, i have the k2 paper ,k2 spray ,k2 liquid.</p><p st=
yle=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-=
stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;H=
elvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings=
: normal;">I can infuse k2 sheets ,k2 envelopes ,k2 magazines ,k2 books.</p=
><p style=3D"font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal; font-size: 13px; line-height: normal; font-family: &=
quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-se=
ttings: normal;">Cannabinoids | Noids | Synthetic Cannabinoids</p><p style=
=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-str=
etch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helv=
etica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: n=
ormal;">K2 Spice paper | K2 paper | K2 Spray | 5cladba | 5F-Mdmb2201 | JWH0=
18 | SGT-78 | 5-CL-ADB-A | 4F-ADB | 5F-MDA19 | MDA-19</p><p style=3D"font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-stretch: norm=
al; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue=
&quot;; margin: 0px; font-kerning: auto; font-feature-settings: normal;">5F=
-MDMB-2201 | 7add | 5F-Mdmb 2201 Pica | MDMB-4en-PINACA</p><p style=3D"font=
-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: no=
rmal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Ne=
ue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: normal;">=
AB-PINACA | JWH-250 | 4f-mdmb-2201 | Amb-fubinaca | 4f-adb | 4FADB</p><p st=
yle=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-=
stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;H=
elvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings=
: normal;">6Cladba | GBH | GBL | SGT 78 | Crack C | 6-APDB</p><p style=3D"f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-stretch:=
 normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica=
 Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: normal=
;">BMK-Oil | MDP2P | PMK Oil | 5F-AKB-48 | 5F-PB22 | 6-APB</p><p style=3D"f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-stretch:=
 normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica=
 Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: normal=
;">we do K2 Express overnight shipping and we can also make your k2 sheets =
come in the form of legal mail.</p><p style=3D"font-variant-numeric: normal=
; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; l=
ine-height: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; f=
ont-kerning: auto; font-feature-settings: normal;">#k2sheetsforsale</p><p s=
tyle=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font=
-stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;=
Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-setting=
s: normal;">#buyk2sheets=C2=A0</p><p style=3D"font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; li=
ne-height: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; fo=
nt-kerning: auto; font-feature-settings: normal;">#k2paperforsale</p><p sty=
le=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-s=
tretch: normal; font-size: 13px; line-height: normal; font-family: &quot;He=
lvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings:=
 normal;">#k2liquidforsale</p><p style=3D"font-variant-numeric: normal; fon=
t-variant-east-asian: normal; font-stretch: normal; font-size: 13px; line-h=
eight: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-k=
erning: auto; font-feature-settings: normal;">#k2spiceforsale</p><p style=
=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-str=
etch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helv=
etica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: n=
ormal;">#k2sprayforsale</p><p style=3D"font-variant-numeric: normal; font-v=
ariant-east-asian: normal; font-stretch: normal; font-size: 13px; line-heig=
ht: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kern=
ing: auto; font-feature-settings: normal;">You can buy the k2 spice=C2=A0 s=
heets and write a nice loving letter to your pal in prison.</p><p style=3D"=
font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch=
: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetic=
a Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: norma=
l;">The k2 sheets are clean and have no stains and can pass all test to get=
 into any and every facility without any problems.</p><p style=3D"font-vari=
ant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal;=
 font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&qu=
ot;; margin: 0px; font-kerning: auto; font-feature-settings: normal;">K2 Sp=
ice Spray Diablo.=C2=A0Diablo K2=C2=A0liquid=C2=A0spray on paper=C2=A0is on=
e of the best selling item from the top-rated company=C2=A0Diablo.=C2=A0Dia=
blo=C2=A0incense infused sheets.=C2=A0</p><p style=3D"font-variant-numeric:=
 normal; font-variant-east-asian: normal; font-stretch: normal; font-size: =
13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; margin:=
 0px; font-kerning: auto; font-feature-settings: normal;">Diablo k2 spray o=
n paper, Diablo K2 Liquid Spray on Paper, Buy Diablo K2 paper, diablo k2 fo=
r sale, diablo incense spray, diablo k2 spray bottle.=C2=A0</p><p style=3D"=
font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch=
: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetic=
a Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: norma=
l;">K2 Spray=C2=A0</p><p style=3D"font-variant-numeric: normal; font-varian=
t-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: n=
ormal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning: =
auto; font-feature-settings: normal;">5F-MDMB2201=C2=A0</p><p style=3D"font=
-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: no=
rmal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Ne=
ue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: normal;">=
=C2=A05CL-ADB-A=C2=A0</p><p style=3D"font-variant-numeric: normal; font-var=
iant-east-asian: normal; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kernin=
g: auto; font-feature-settings: normal;">Diablo k2 paper=C2=A0</p><p style=
=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-str=
etch: normal; font-size: 13px; line-height: normal; font-family: &quot;Helv=
etica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: n=
ormal;">Cannabinoid k2 paper=C2=A0</p><p style=3D"font-variant-numeric: nor=
mal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px=
; line-height: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px=
; font-kerning: auto; font-feature-settings: normal;">K2 eliquid paper=C2=
=A0</p><p style=3D"font-variant-numeric: normal; font-variant-east-asian: n=
ormal; font-stretch: normal; font-size: 13px; line-height: normal; font-fam=
ily: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feat=
ure-settings: normal;">JWH-018 k2 paper=C2=A0</p><p style=3D"font-variant-n=
umeric: normal; font-variant-east-asian: normal; font-stretch: normal; font=
-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
margin: 0px; font-kerning: auto; font-feature-settings: normal;">Bizzaro k2=
 papers=C2=A0</p><p style=3D"font-variant-numeric: normal; font-variant-eas=
t-asian: normal; font-stretch: normal; font-size: 13px; line-height: normal=
; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto;=
 font-feature-settings: normal;">White Tiger k2 paper=C2=A0</p><p style=3D"=
font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch=
: normal; font-size: 13px; line-height: normal; font-family: &quot;Helvetic=
a Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings: norma=
l;">Green Giant k2 paper=C2=A0</p><p style=3D"font-variant-numeric: normal;=
 font-variant-east-asian: normal; font-stretch: normal; font-size: 13px; li=
ne-height: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; fo=
nt-kerning: auto; font-feature-settings: normal;">Cloud 9 k2 paper=C2=A0</p=
><p style=3D"font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal; font-size: 13px; line-height: normal; font-family: &=
quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-se=
ttings: normal;">Kush K2 paper=C2=A0</p><p style=3D"font-variant-numeric: n=
ormal; font-variant-east-asian: normal; font-stretch: normal; font-size: 13=
px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0=
px; font-kerning: auto; font-feature-settings: normal;">Kratom k2 paper=C2=
=A0</p><p style=3D"font-variant-numeric: normal; font-variant-east-asian: n=
ormal; font-stretch: normal; font-size: 13px; line-height: normal; font-fam=
ily: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feat=
ure-settings: normal;">Mad Halloween k2 paper=C2=A0</p><p style=3D"font-var=
iant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal=
; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&q=
uot;; margin: 0px; font-kerning: auto; font-feature-settings: normal;">7H p=
unch k2 paper=C2=A0</p><p style=3D"font-variant-numeric: normal; font-varia=
nt-east-asian: normal; font-stretch: normal; font-size: 13px; line-height: =
normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning:=
 auto; font-feature-settings: normal;">Pink blossom k2 paper=C2=A0</p><p st=
yle=3D"font-variant-numeric: normal; font-variant-east-asian: normal; font-=
stretch: normal; font-size: 13px; line-height: normal; font-family: &quot;H=
elvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-settings=
: normal;">Mr. Nice guy k2 paper=C2=A0</p><p style=3D"font-variant-numeric:=
 normal; font-variant-east-asian: normal; font-stretch: normal; font-size: =
13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; margin:=
 0px; font-kerning: auto; font-feature-settings: normal;">Kilmaxx k2 paper=
=C2=A0</p><p style=3D"font-variant-numeric: normal; font-variant-east-asian=
: normal; font-stretch: normal; font-size: 13px; line-height: normal; font-=
family: &quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-f=
eature-settings: normal;">Green blossom k2 paper=C2=A0</p><p style=3D"font-=
variant-numeric: normal; font-variant-east-asian: normal; font-stretch: nor=
mal; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neu=
e&quot;; margin: 0px; font-kerning: auto; font-feature-settings: normal;">b=
uy k2 liquid spice spray and papers online, get the best diablo spray infus=
e in 100% cotton papers.=C2=A0I have the k2 sheets, k2 envelopes, k2 greeti=
ng cards, k2 books, k2 magazines.</p><p style=3D"font-variant-numeric: norm=
al; font-variant-east-asian: normal; font-stretch: normal; font-size: 13px;=
 line-height: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px;=
 font-kerning: auto; font-feature-settings: normal;">I can send it legal ma=
il and can also make it look like it's coming directly from a bookstore.</p=
><p style=3D"font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal; font-size: 13px; line-height: normal; font-family: &=
quot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-se=
ttings: normal;">If you're looking for the k2 spice diablo sheets or liquid=
 to give you that man-down effect (Diablo!!).</p><p style=3D"font-variant-n=
umeric: normal; font-variant-east-asian: normal; font-stretch: normal; font=
-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
margin: 0px; font-kerning: auto; font-feature-settings: normal;"><br /></p>=
<p style=3D"font-variant-numeric: normal; font-variant-east-asian: normal; =
font-stretch: normal; font-size: 13px; line-height: normal; font-family: &q=
uot;Helvetica Neue&quot;; margin: 0px; font-kerning: auto; font-feature-set=
tings: normal;"><br /></p><p style=3D"font-variant-numeric: normal; font-va=
riant-east-asian: normal; font-stretch: normal; font-size: 13px; line-heigh=
t: normal; font-family: &quot;Helvetica Neue&quot;; margin: 0px; font-kerni=
ng: auto; font-feature-settings: normal;"><br /></p>https://t.me/motionking=
_caliweed_psychedelics<br /><div class=3D"gmail_quote"><div dir=3D"auto" cl=
ass=3D"gmail_attr">On Monday, June 3, 2024 at 4:56:11=E2=80=AFAM UTC+1 Asah=
 Randy wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: =
0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"=
><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychedeli=
cs" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelic=
s&amp;source=3Dgmail&amp;ust=3D1717473372630000&amp;usg=3DAOvVaw0OdhQ4NFYEP=
V5uTT2HC6Q-">https://t.me/motionking_caliweed_psychedelics</a><br></div><br=
><p style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvet=
ica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal"><=
br></p><p style=3D"font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;=
Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:nor=
mal">Buy K2 Sheets ,Buy K2 Spice Paper,K2 Paper,K2 Spray,K2 Liquid,Buy K2 h=
erb,Buy K2 Chemicals.Every =C2=A0K2 Sheets is infuse with 200 ml of the k2 =
liquid Diablo Incense.<br></p><p style=3D"font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;fo=
nt-feature-settings:normal">I have the k2 sheets already made, i have the k=
2 paper ,k2 spray ,k2 liquid.</p><p style=3D"font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height=
:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto=
;font-feature-settings:normal">I can infuse k2 sheets ,k2 envelopes ,k2 mag=
azines ,k2 books.</p><p style=3D"font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font=
-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-featur=
e-settings:normal">Cannabinoids | Noids | Synthetic Cannabinoids</p><p styl=
e=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-stretc=
h:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue=
&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">K2 Spice =
paper | K2 paper | K2 Spray | 5cladba | 5F-Mdmb2201 | JWH018 | SGT-78 | 5-C=
L-ADB-A | 4F-ADB | 5F-MDA19 | MDA-19</p><p style=3D"font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line=
-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerni=
ng:auto;font-feature-settings:normal">5F-MDMB-2201 | 7add | 5F-Mdmb 2201 Pi=
ca | MDMB-4en-PINACA</p><p style=3D"font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-fea=
ture-settings:normal">AB-PINACA | JWH-250 | 4f-mdmb-2201 | Amb-fubinaca | 4=
f-adb | 4FADB</p><p style=3D"font-variant-numeric:normal;font-variant-east-=
asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font-fam=
ily:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-se=
ttings:normal">6Cladba | GBH | GBL | SGT 78 | Crack C | 6-APDB</p><p style=
=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch=
:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&=
quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">BMK-Oil | =
MDP2P | PMK Oil | 5F-AKB-48 | 5F-PB22 | 6-APB</p><p style=3D"font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:=
13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;f=
ont-kerning:auto;font-feature-settings:normal">we do K2 Express overnight s=
hipping and we can also make your k2 sheets come in the form of legal mail.=
</p><p style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;=
font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Hel=
vetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal=
">#k2sheetsforsale</p><p style=3D"font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;fon=
t-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-featu=
re-settings:normal">#buyk2sheets=C2=A0</p><p style=3D"font-variant-numeric:=
normal;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;li=
ne-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-ker=
ning:auto;font-feature-settings:normal">#k2paperforsale</p><p style=3D"font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;ma=
rgin:0px;font-kerning:auto;font-feature-settings:normal">#k2liquidforsale</=
p><p style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helve=
tica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">=
#k2spiceforsale</p><p style=3D"font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font-f=
amily:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-=
settings:normal">#k2sprayforsale</p><p style=3D"font-variant-numeric:normal=
;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-hei=
ght:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:a=
uto;font-feature-settings:normal">You can buy the k2 spice=C2=A0 sheets and=
 write a nice loving letter to your pal in prison.</p><p style=3D"font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-=
size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:=
0px;font-kerning:auto;font-feature-settings:normal">The k2 sheets are clean=
 and have no stains and can pass all test to get into any and every facilit=
y without any problems.</p><p style=3D"font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-=
feature-settings:normal">K2 Spice Spray Diablo.=C2=A0Diablo K2=C2=A0liquid=
=C2=A0spray on paper=C2=A0is one of the best selling item from the top-rate=
d company=C2=A0Diablo.=C2=A0Diablo=C2=A0incense infused sheets.=C2=A0</p><p=
 style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-s=
tretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica=
 Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">Diab=
lo k2 spray on paper, Diablo K2 Liquid Spray on Paper, Buy Diablo K2 paper,=
 diablo k2 for sale, diablo incense spray, diablo k2 spray bottle.=C2=A0</p=
><p style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvet=
ica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">K=
2 Spray=C2=A0</p><p style=3D"font-variant-numeric:normal;font-variant-east-=
asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font-fam=
ily:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-se=
ttings:normal">5F-MDMB2201=C2=A0</p><p style=3D"font-variant-numeric:normal=
;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-hei=
ght:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:a=
uto;font-feature-settings:normal">=C2=A05CL-ADB-A=C2=A0</p><p style=3D"font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;ma=
rgin:0px;font-kerning:auto;font-feature-settings:normal">Diablo k2 paper=C2=
=A0</p><p style=3D"font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;=
Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:nor=
mal">Cannabinoid k2 paper=C2=A0</p><p style=3D"font-variant-numeric:normal;=
font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heig=
ht:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:au=
to;font-feature-settings:normal">K2 eliquid paper=C2=A0</p><p style=3D"font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;ma=
rgin:0px;font-kerning:auto;font-feature-settings:normal">JWH-018 k2 paper=
=C2=A0</p><p style=3D"font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-stretch:normal;font-size:13px;line-height:normal;font-family:&qu=
ot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:=
normal">Bizzaro k2 papers=C2=A0</p><p style=3D"font-variant-numeric:normal;=
font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heig=
ht:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:au=
to;font-feature-settings:normal">White Tiger k2 paper=C2=A0</p><p style=3D"=
font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:nor=
mal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot=
;;margin:0px;font-kerning:auto;font-feature-settings:normal">Green Giant k2=
 paper=C2=A0</p><p style=3D"font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-stretch:normal;font-size:13px;line-height:normal;font-fami=
ly:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-set=
tings:normal">Cloud 9 k2 paper=C2=A0</p><p style=3D"font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line=
-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerni=
ng:auto;font-feature-settings:normal">Kush K2 paper=C2=A0</p><p style=3D"fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:norma=
l;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;=
margin:0px;font-kerning:auto;font-feature-settings:normal">Kratom k2 paper=
=C2=A0</p><p style=3D"font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-stretch:normal;font-size:13px;line-height:normal;font-family:&qu=
ot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:=
normal">Mad Halloween k2 paper=C2=A0</p><p style=3D"font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line=
-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerni=
ng:auto;font-feature-settings:normal">7H punch k2 paper=C2=A0</p><p style=
=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch=
:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&=
quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">Pink bloss=
om k2 paper=C2=A0</p><p style=3D"font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font=
-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-featur=
e-settings:normal">Mr. Nice guy k2 paper=C2=A0</p><p style=3D"font-variant-=
numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size=
:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px;=
font-kerning:auto;font-feature-settings:normal">Kilmaxx k2 paper=C2=A0</p><=
p style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-=
stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetic=
a Neue&quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">Gre=
en blossom k2 paper=C2=A0</p><p style=3D"font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:nor=
mal;font-family:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;fon=
t-feature-settings:normal">buy k2 liquid spice spray and papers online, get=
 the best diablo spray infuse in 100% cotton papers.=C2=A0I have the k2 she=
ets, k2 envelopes, k2 greeting cards, k2 books, k2 magazines.</p><p style=
=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch=
:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&=
quot;;margin:0px;font-kerning:auto;font-feature-settings:normal">I can send=
 it legal mail and can also make it look like it&#39;s coming directly from=
 a bookstore.</p><p style=3D"font-variant-numeric:normal;font-variant-east-=
asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font-fam=
ily:&quot;Helvetica Neue&quot;;margin:0px;font-kerning:auto;font-feature-se=
ttings:normal">If you&#39;re looking for the k2 spice diablo sheets or liqu=
id to give you that man-down effect (Diablo!!).</p><p style=3D"font-variant=
-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-siz=
e:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;margin:0px=
;font-kerning:auto;font-feature-settings:normal"><br></p><p style=3D"font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;marg=
in:0px;font-kerning:auto;font-feature-settings:normal"><a href=3D"https://t=
.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717473372=
631000&amp;usg=3DAOvVaw1qZMWHDJmiyq4KDOq-9igr">https://t.me/motionking_cali=
weed_psychedelics</a><br></p></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4706bf6e-e51a-4400-863a-f4bd5e2a9cd9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4706bf6e-e51a-4400-863a-f4bd5e2a9cd9n%40googlegroups.co=
m</a>.<br />

------=_Part_315159_1403914300.1717387101568--

------=_Part_315158_205385406.1717387101568--
